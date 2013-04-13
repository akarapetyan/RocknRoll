// Navigation pane project template
import bb.cascades 1.0

Page {
    // page with a picture detail
    id: pgWeb
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
                    text: "Listen the music"
                }    
            }            
        }
        WebView {
            id: youtube               
        }       
    }
}
