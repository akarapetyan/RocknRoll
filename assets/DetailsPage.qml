// Navigation pane project template
import bb.cascades 1.0

Page {
    // page with a picture detail
    id: pgDetail
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
        background: Color.White
        Label {
            text: qsTr("Hottness/Energy Graph")
            horizontalAlignment: HorizontalAlignment.Center
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
                color: Color.Yellow
            }
        }
        ScrollView {
            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill
            scrollViewProperties.pinchToZoomEnabled: true
            scrollViewProperties.scrollMode: ScrollMode.Both
            
            WebView {
                id: webView
                url: "local:///assets/web/test.html"
                
                onMinContentScaleChanged: {
                    scrollView.scrollViewProperties.minContentScale = minContentScale;
                }
                
                onMaxContentScaleChanged: {
                    scrollView.scrollViewProperties.maxContentScale = maxContentScale;
                }
            }        
        }
    }
    attachedObjects: [
        ComponentDefinition {
            id: genrePageDefinition
            source: "GenrePage.qml"
        }
    ]

}
