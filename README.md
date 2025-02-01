# Core Gangs Teleport System

A FiveM resource designed specifically for **QBCore** servers, allowing players to teleport between key locations, with integrated gang verification and fully configurable options.

## Features
- **Gang-Specific Teleportation:** Teleport players to their gang's designated neighborhood or common locations.
- **Lobby Teleport Options:** Teleport to Legion Square, Airport, Legion Garage, or custom gang zones.
- **Gang Verification:** Teleportation to gang zones is restricted to members of recognized gangs.
- **Notifications:** Customizable notification system using either `qbcore` or `codem-notification`.
- **Target Zone Interaction:** Players can interact with a target zone to open the teleport menu.
- **Optimized Performance:** Designed for low MS usage.

---

## Requirements
- **QBCore Framework**
- **ox_target**
- **ox_lib**
- **codem-notification** (optional if using `codem-notification`)
- **core-gangs**

---

## Installation

1. **Download & Install:**
   Clone or download the resource to your server's resources directory:
   ```bash
   git clone https://github.com/YuvalWeb8/yw-teleportMenu.git
   ```

2. **Dependencies:**
   Ensure the required dependencies (`ox_lib`, `core_gangs`) are installed.

3. **Start the Resource:**
   Add the following to your server's `server.cfg`:
   ```bash
   ensure yw-teleportMenu
   ```

4. **Configuration:**
   Modify the `config.lua` to set up teleport points, gang settings, and notification preferences.

---

## Configuration

### Main Configurations (`config.lua`)
```lua
Config = {}

Config.GangTeleport = true  -- Enable/Disable gang-specific teleportation.

Config.Notification = 'codem-notification'  -- Choose between 'qbcore' and 'codem-notification'.

Config.Coords = {
    ["SpawnerMenu"] = {
        [1] = {coords = vector3(-1012.92, -2699.32, 14.14)}
    }
}
```

### Gang Locations
- Chang Neighborhood: `-684.38, -889.07, 24.50`
- GSF Neighborhood: `-136.11, -1594.91, 34.24`
- Ballas Neighborhood: `105.71, -1940.45, 20.80`

---

## How to Use
1. **Interact with the Target Zone:** Approach the teleport point defined in `Config.Coords["SpawnerMenu"]`.
2. **Open the Menu:** The interaction will trigger a teleport menu with options.
3. **Select a Destination:** Choose between available locations such as:
   - **Legion Square**
   - **Airport**
   - **Legion Garage**
   - **Gang Neighborhood** (if applicable)

---

## Notifications
- The script supports two notification systems:
  - **`codem-notification`** for custom notifications.
  - **`qbcore`** for default framework-based notifications.

Modify the notification type in `config.lua`:
```lua
Config.Notification = 'codem-notification' -- Change to 'qbcore' if needed.
```

---

## Development Notes
- **Performance:** The script is optimized to run checks at 1-second intervals to maintain low server impact.
- **Custom Gangs:** To add custom gangs and locations, modify the `gangLocations` table within the `client.lua` file.

```lua
local gangLocations = {
    CHANG = {coords = {x = -684.38, y = -889.07, z = 24.50}, message = 'You are teleporting to Chang neighborhood'},
    GSF = {coords = {x = -136.11, y = -1594.91, z = 34.24}, message = 'You are teleporting to GSF neighborhood'},
    BALLAS = {coords = {x = 105.71, y = -1940.45, z = 20.80}, message = 'You are teleporting to Ballas neighborhood'}
}
```

---

## Issues & Contributions
For any questions or issues, feel free to open a GitHub issue or contact me directly.

---


## Preview
[Click Here
](https://media.discordapp.net/attachments/1155158371800989696/1329169501882814525/image.png?ex=679f1dd0&is=679dcc50&hm=b528502d02b134eeb08ee16b8fb7a23358229d889609bd6b6d098c48eeb90611&=&format=webp&quality=lossless)

**For help, DM me:** `.yuvalweb_`

