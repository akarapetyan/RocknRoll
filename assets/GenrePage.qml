// Navigation pane project template
import bb.cascades 1.0

Page {
    // page with a picture detail
    id: pgGenre
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
        
    }
    attachedObjects: [
        ComponentDefinition {
            id: artistPageDefinition
            source: "ArtistPage.qml"
        }
    ]
}
