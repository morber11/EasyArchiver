const archiveUrl = 'https://archive.is/?run=1&url='

chrome.action.onClicked.addListener((tab) => {
    let url = `${archiveUrl}${encodeURIComponent(tab.url)}`;
    chrome.tabs.create({ url: url });
});

chrome.contextMenus.create({
    id: "archivePage",
    title: "Archive this page",
    contexts: ["page"]
});

chrome.contextMenus.create({
    id: "archiveLink",
    title: "Archive this link",
    contexts: ["link"]
});

chrome.contextMenus.onClicked.addListener((info, tab) => {
    if (info.menuItemId === "archivePage") {
        let url = `${archiveUrl}${encodeURIComponent(tab.url)}`;
        chrome.tabs.create({ url: url, active: false });
    } else if (info.menuItemId === "archiveLink") {
        let url = `${archiveUrl}${encodeURIComponent(info.linkUrl)}`;
        chrome.tabs.create({ url: url, active: false });
    }
});