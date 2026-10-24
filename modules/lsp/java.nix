{
  lib,
  pkgs,
  config,
  options,
  ...
}: {

  config = {
    vim = {
      languages.java = {
        enable = true;

        dap = {
          # TODO: re-enable once nvf fixes the stale mvnHash for jls-0.9.0.
          # The global enableDAP pulls in the jls debug adapter, whose Maven
          # fixed-output hash no longer matches upstream (hash mismatch).
          enable = false;
        };
      };
    };
  };
}
