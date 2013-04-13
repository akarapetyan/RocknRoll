// Navigation pane project template
import bb.cascades 1.0

Page {
    // page with a picture detail
    id: pgArtist
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            onTriggered: {
                // define what happens when back button is pressed here
                // in this case is closed the detail page
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
                    text: "Music List"
                }    
            }            
        }
        
        Container {                        
            SongListView {}    
        }        
    } 
    
    actions: [            
        InvokeActionItem {
            title: qsTr("Share")
            ActionBar.placement: ActionBarPlacement.InOverflow
            query {
                mimeType: "text/plain"
                invokeActionId: "bb.action.SHARE"
            }
            onTriggered: {
                //data =  "Song: " + ayer." + playerController.pid + "." + playerController.personal.firstname + "-" + playerController.personal.lastname + ".html"
            }            
        }
    ]
}
