# EasyArchiver

## Description

**EasyArchiver** is a user-friendly tool designed for archiving files using Archive.is.

At the moment this is still in an experimental phase and is still awaiting release to the Chrome Web Store

## Links
### Firefox
- https://addons.mozilla.org/en-US/firefox/addon/easy-archive-is-archiver/

## Building

To build the project, execute the `build.ps1` script with a parameter of either `firefox` or `chrome`.

This will create a new folder in the directory called `out` which contains the relevant files depending on whether you selected `firefox` or `chrome`. 

It will also contain a .zip archive of all the relevant files.

## Manual Installation

After building the file, follow the steps below to add it to your browser:

### For Firefox:

1. Click on `Settings`.
2. Select `Add-ons`.
3. In the Add-ons manager, click the setting wheel and select `Install add-on from file`.
4. Drag and drop the `.zip` file into Firefox.

### For Chrome:

1. Click on `Settings`.
2. Select `Extensions`.
3. Enable `Developer mode` in the top right.
4. Click on `Load unpacked`.
5. Select the `out` folder.

## Troubleshooting

If you encounter any issues while using **EasyArchiver**, please refer to the following sections based on your browser:

### For Firefox:

1. Ensure that you have the latest version of Firefox installed.
2. Check if the add-on is enabled in `Add-ons` settings.
3. Try disabling `xpinstall.signatures.required` in `about:config`
4. If the problem persists, try reinstalling the add-on.

### For Chrome:

1. Ensure that you have the latest version of Chrome installed.
2. Check if the extension is enabled in `Extensions` settings.
3. If the problem persists, try reinstalling the extension.
