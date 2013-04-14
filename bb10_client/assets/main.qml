// Navigation pane project template
import bb.cascades 1.0

NavigationPane {
    id: navigationPane
    Page {
        
        Container {
            background: Color.Black
            layout: DockLayout {}
                        
            Button {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                text: qsTr("Show detail")
                imageSource: "asset:///images/picture1thumb.png"
                onClicked: {
                    // show detail page when the button is clicked
                    var page = getSecondPage();
                    console.debug("pushing detail " + page)
                    navigationPane.push(page);
                    OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayLandscape;
                }
                property Page secondPage
                function getSecondPage() {
                    if (! secondPage) {
                        secondPage = secondPageDefinition.createObject();
                    }
                    return secondPage;
                }
                attachedObjects: [
                    ComponentDefinition {
                        id: secondPageDefinition
                        source: "DetailsPage.qml"
                    }, 
                    ComponentDefinition {
                        id: appCover
                        source: "AppCover.qml"
                    }
                ]
            }
        }        
    }
    
    onCreationCompleted: {
        // enable layout to adapt to the device rotation
        // don't forget to enable screen rotation in bar-bescriptor.xml (Application->Orientation->Auto-orient)
        //OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.All;
        
        Application.cover = appCover.createObject();
    }    
}
