// Navigation pane project template
import bb.cascades 1.0

Page {
    // page with a picture detail
    id: pgGenre
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            onTriggered: {
                // define what happens when back button is pressed here
                // in this case change the device orientation and close the detail page
                OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayLandscape;
                navigationPane.pop()
            }
        }
    }
    
    Container {
        layout: StackLayout {}
        
        Container {
            layout: DockLayout {}
            
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Fill
            ImageView {  
                imageSource: "images/header.png"
            }
            Container {
                verticalAlignment: VerticalAlignment.Center
                horizontalAlignment: HorizontalAlignment.Center
                Label {
                    text: "Music Genres"
                }    
            }
            
        }
        
        Container {                        
            AlbumListView {}    
        }        
    }
    attachedObjects: [
        ComponentDefinition {
            id: artistPageDefinition
            source: "ArtistPage.qml"
        }
    ]    
}
