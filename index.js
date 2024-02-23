// at some point this will be moved to settings...
const archiveUrl = 'https://archive.is/?run=1&url='

browser.browserAction.onClicked.addListener((tab) => {
    let url = `${archiveUrl}${encodeURIComponent(tab.url)}`;
    browser.tabs.create({ url: url });
});

browser.contextMenus.create({
    id: "archivePage",
    title: "Archive this page",
    contexts: ["page"]
});

browser.contextMenus.create({
    id: "archiveLink",
    title: "Archive this link",
    contexts: ["link"]
});

browser.contextMenus.onClicked.addListener((info, tab) => {
    if (info.menuItemId === "archivePage") {
        let url = `${archiveUrl}${encodeURIComponent(tab.url)}`;
        browser.tabs.create({ url: url, active: false });
    } else if (info.menuItemId === "archiveLink") {
        let url = `${archiveUrl}${encodeURIComponent(info.linkUrl)}`;
        browser.tabs.create({ url: url, active: false });
    }
});