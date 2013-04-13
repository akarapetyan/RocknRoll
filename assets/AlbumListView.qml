import bb.cascades 1.0
import bb.system 1.0

ListView {
    property int page_type: -1
    dataModel: _model
    listItemComponents: [
        ListItemComponent {
            type: "item"
            Container {
                id: itemRoot
                
	            AlbumContainer {}
	            
	            Container {
	                ImageView {
			            imageSource: "images/sf_line.png"
			            scalingMethod: ScalingMethod.None
			        }
			    }
		    }
        }
    ]
    
    attachedObjects: [
        ComponentDefinition {
            id: inAlbumPage
            source: "InAlbumPage.qml"
        }
    ]
    
    function openAlbum(albumName) {
        console.log("... openAlbum (" + albumName + ")...");
        // Let cpp know about album name
        app.setAlbumName(albumName);
        // Open in album page
        var inAlbumPageObj = inAlbumPage.createObject();
        // Set album page name
        inAlbumPageObj.setAlbumName(albumName);
        // Set album view model
        inAlbumPageObj.setModel(modelInAlbum);
        inAlbumPageObj.setAlbumType(page_type);
        // Show page
        homeScreenTabPane.activeTab.content.push(inAlbumPageObj);
    }
    
//    function hidePhoto(selectedFileName, albumName) {
//        console.log("... AlbumListView::hidePhoto (" + selectedFileName + ", " + albumName + ")...");
//        app.hidePhoto(selectedFileName, albumName);
//    }
//
//    function addAlbum(name) {
//        console.log("... AlbumListView::addAlbum (" + name + ")...");
//        _model.insert({ "albumName": name, "itemsCount" : 0 });
//    }
    onCreationCompleted: {
        console.log("ListViewon CreationCompleted !!!!!!!!!!!")        
    }
}
