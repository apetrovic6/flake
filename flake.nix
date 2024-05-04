{
  description = "apetrovic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    home-manager =  {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    nixos-cosmic = {
      url = "github:lilyinstarlight/nixos-cosmic";
      inputs.nixpkgs.follows = "nixpkgs";
    };


  };

  outputs = { self, nixpkgs, home-manager, nixos-cosmic, nixvim,  ... }: 
   let
     system = "x86_64-linux";
     inherit (import ./settings.nix) userSettings systemSettings;

     pkgs = import nixpkgs {
       inherit system;
       config = { allowUnfree = true; };
     };

    lib = nixpkgs.lib;

  in {
     nixosConfigurations =  {
       nix = lib.nixosSystem  {
	  inherit system;
          
	  specialArgs =  { 
	    inherit userSettings; 
	    inherit systemSettings;
	  };

	  modules = [
	    ./configuration.nix
	    home-manager.nixosModules.home-manager  {
	      home-manager.extraSpecialArgs =  {
		inherit userSettings;
		inherit systemSettings;
	      };

	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.${userSettings.username} = {
	        imports = [ ./home ];

	      };
	    }

	  ];
       };
       zephyrus = lib.nixosSystem  {
	  inherit system;
          
	  specialArgs =  { 
	    inherit userSettings; 
	    inherit systemSettings;
	  };
           

	  modules = [
           {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };

           }

            nixos-cosmic.nixosModules.default

	    ./hosts/laptop/configuration.nix
	    home-manager.nixosModules.home-manager  {
	      home-manager.extraSpecialArgs =  {
		inherit userSettings;
		inherit systemSettings;
	      };
        

	      home-manager.useGlobalPkgs = true;
	      home-manager.useUserPackages = true;
	      home-manager.users.${userSettings.username} = {
	        imports = [ ./home ];
	      };
	    }

	  ];
       };
     };
  };
}
