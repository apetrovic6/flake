 let
     system = "x86_64-linux";

     systemSettings = {
       hostname = "zephyrus";
       timezone = "Europe/Zagreb";
     };

     userSettings = {
       username = "apetrovic";
       name = "Ante Petrovic";
       gitUsername = "apetrovic6";
       gitEmail = "petrovicante6@gmail.com";
       email = "petrovicante6@gmail.com";
     };

in {
  inherit system;
  inherit systemSettings;
  inherit userSettings;
}
