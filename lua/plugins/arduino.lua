return {
  {
    "arduino/arduino-language-server",
    init = function()
      require("lspconfig").arduino_language_server.setup({
        cmd = {
          "arduino-language-server",
          "-cli-config",
          "~/.arduino15/arduino-cli.yaml",
          "-fqbn",
          "esp32:esp32:esp32",
        },
      })
    end,
  },
}
