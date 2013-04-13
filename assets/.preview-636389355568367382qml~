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
        background: Color.Black
        Label {
            text: qsTr("Hottness/Energy Graph")
            horizontalAlignment: HorizontalAlignment.Center
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
                color: Color.Yellow
            }
        }
        WebView {
            id: webView
            url: "local:///assets/web/test.html"    
        }
    }
}
