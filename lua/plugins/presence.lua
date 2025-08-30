return {
  "andweeb/presence.nvim",
  config = function()
    local quotes = {
      "⚔️ In the midst of chaos, there is code.",
      "🌌 Creating worlds, one line at a time.",
      "🔥 Power comes to those who debug.",
      "🔮 The code chooses the coder.",
    }

    require("presence").setup({
      client_id = "1409505642988830763",
      auto_update = true,
      neovim_image_text = "Krishu’s Dojutsu 👁",
      main_image = "sharingan", -- 👁 your uploaded Sharingan image
      show_time = true,

      editing_text = function(filename)
        return "🖋️ Forging " .. filename .. " — " .. quotes[math.random(#quotes)]
      end,
      file_explorer_text = "📂 Searching hidden scrolls...",
      git_commit_text = "📝 Binding fate in commits",
      workspace_text = "🚀 Project: %s",
      line_number_text = "📍 Line %s of %s",
    })
  end,
}
