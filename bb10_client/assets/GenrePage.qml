// Navigation pane project template
import bb.cascades 1.0

Page {    
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
        //background: back.imagePaint
        
        Container {
            layout: DockLayout {}
            
            verticalAlignment: VerticalAlignment.Top            
            ImageView {                  
                imageSource: "images/header1.png"
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
}
