{
  description = "apetrovic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

    hyprland-plugins = {
     url = "github:hyprwm/hyprland-plugins";
     inputs.hyprland.follows = "hyprland";
    };

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

    stylix.url = "github:danth/stylix";

  };

  outputs = { self, nixpkgs, home-manager, nixos-cosmic, nixvim, hyprland, stylix, ... } @inputs : 
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
   

       citadel = lib.nixosSystem  {
              inherit system;

              specialArgs =  { 
                inherit userSettings; 
                inherit systemSettings;
                inherit inputs;
              };

          modules = [
#           stylix.nixosModules.stylix

           {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
           }

            hyprland.nixosModules.default
            nixos-cosmic.nixosModules.default

            ./hosts/desktop/configuration.nix
            home-manager.nixosModules.home-manager  {
              home-manager.extraSpecialArgs =  {
                      inherit userSettings;
                      inherit systemSettings;
                      inherit inputs;
              };


              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.${userSettings.username} = {
                imports = [
		  ./home 
		];
              };
            }

          ];
       };




       zephyrus = lib.nixosSystem  {
	      inherit system;
          
	      specialArgs =  { 
	        inherit userSettings; 
	        inherit systemSettings;
	        inherit inputs;
	      };

	  modules = [
           {
            nix.settings = {
              substituters = [ "https://cosmic.cachix.org/" ];
              trusted-public-keys = [ "cosmic.cachix.org-1:Dya9IyXD4xdBehWjrkPv6rtxpmMdRel02smYzA85dPE=" ];
            };
           }

            hyprland.nixosModules.default
            nixos-cosmic.nixosModules.default
 #           stylix.nixosModules.stylix

	    ./hosts/laptop/configuration.nix

	    home-manager.nixosModules.home-manager  {
	      home-manager.extraSpecialArgs =  {
		      inherit userSettings;
		      inherit systemSettings;
		      inherit inputs;
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
