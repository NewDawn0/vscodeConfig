# **ndvscode** – Your No-Nonsense, Pre-Tuned VS Code Flake 🚀

So you want **VS Code**, but with **less setup** and **more hacking**? Meet **ndvscode**, the **flake-powered, pre-configured** VS Code you didn’t know you needed.

---

## **What's Inside?** 📦

✅ **`ndvscode`** → The VS Code package itself.
✅ **`ndvscode-config`** → A **ready-to-go `settings.json`**, because defaults are for cowards.

Preloaded with:
🎨 **Everblush Theme** – Because your editor should look _cool_.
🖥️ **Vim Keybinds** – Real programmers don’t use mice.
🔌 **Commonly Used Extensions** – The good stuff, already installed.

---

## **Installation** 💻

### **1️⃣ Install the Flake**

```nix
# In your system flake
{
    # Add to your inputs
    inputs.vscode-cfg.url = "github:NewDawn0/vscodeConfig";
    # ...
    # Add to overlays
    overlays = [ inputs.vscode-cfg.overlays.default ];
    # ...
    # Add to your packages
    environment.systemPackages = with pkgs; [ ndvscode ]
}
```

Boom. VS Code is installed. 🎉

### **2️⃣ Link the Config (Manually 😞, Because Nix is Sandboxy)**

On **Linux**:

```sh
ln -sf $(nix path-info github:NewDawn0/vscodeConfig#ndvscode-config)/share/settings.json ~/.config/Code/User/settings.json
```

On **macOS**:

```sh
ln -sf $(nix path-info github:NewDawn0/vscodeConfig#ndvscode-config)/share/settings.json "$HOME/Library/Application Support/Code/User/settings.json"
```

Now your VS Code actually _uses_ the good config.

---

## **Why Use This?** 🤔

- **Faster setup** → One command, no hunting for extensions.
- **Consistent environment** → Same config across all machines.
- **Minimal effort, maximum coding** → Because tweaking settings is _not_ a hobby.

## **Contributing** 👨💻

Found an extension that _everyone_ needs? Want to tweak some settings? PRs welcome!

---

🔧 **ndvscode** – because setting up VS Code should be a one-liner, not a side quest. 🚀
