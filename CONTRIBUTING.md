## Developing


1.  Clone the repository

        $ git clone https://github.com/tabwrangler/tabwrangler

2.  Install all dependencies

        $ npm install

3.  Build, output, and watch the contents to `dist/chrome/` or  `dist/firefox/`

        $ npm run start

### Test on Chrome

4.  Open the Extensions page in Chrome via _Window > Extensions_
5.  Check the "Developer mode" checkbox in upper right
6.  Click the "Load unpacked extension..." button and select the `dist/chrome/` directory created in
    #Developing step 3.

### Test on Firefox

4.  Open the Add-ons page in Firefox via _Tools > Add-ons_
5.  Open the cog wheel dropdown and select _Debug Add-ons_
6.  Click the "Load Temporary Add-on" button and select the `dist/firefox/manifest.json` file created
    in #Developing step 3.

### Building for Release

1.  Create a .zip to upload to the Chrome Store and Firefox AMO with the `build` task

        $ npm run build

## Nix support

If you don't have node and npm installed, you can run

        $ nix develop

to be dropped in a shell with the dependencies you need.

To build the extension and run all tests, you can also simply run

        $ nix build

## Contributing Translations

Contribute on [Tab Wrangler's Crowdin Project][3], and your translations will be automatically
added to the project.

Note: For further details on Chrome extension i18n, check out the Chrome extension documentation
on [i18n messages][0].

Making Tab Wrangler available in languages other than English is possible due to generous
contributors. If you'd like to contribute, please follow the instructions above and create a pull
request with your updates.

[0]: https://developer.chrome.com/apps/i18n-messages
[1]: https://developer.chrome.com/webstore/i18n?csw=1#localeTable
[3]: https://crowdin.com/project/tab-wrangler
