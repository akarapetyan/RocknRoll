// Navigation pane project template
import bb.cascades 1.0

Page {
    // page with a picture detail
    id: pgDetail    
    
    property bool isPlaying: false
    
    paneProperties: NavigationPaneProperties {
        backButton: ActionItem {
            onTriggered: {                
                isPlaying = false;
                OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayPortrait;
                navigationPane.pop()                
            }
        }
    }
    Container {
        background: Color.Black
        Label {
            id: titleLabel
            text: qsTr("Hottness/Energy Graph")
            horizontalAlignment: HorizontalAlignment.Center
            textStyle {
                base: SystemDefaults.TextStyles.TitleText
                color: Color.Yellow
            }
        }
        
        Container {
            minWidth: 1280
            maxWidth: 1280
            ScrollView {
                id: scrollView
                
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                scrollViewProperties.pinchToZoomEnabled: true
                scrollViewProperties.scrollMode: ScrollMode.Both
                WebView {
                    minWidth: 1280
                    maxWidth: 1280
                    id: webView
                    //url: "local:///assets/web/map-final.html"
                    url: "local:///assets/web/map-final-BB.html"
                    
                    
                    onMessageReceived: {
                        console.log("message.data ======== " + message.data)
                        if(message.data === "" || message.data == null) {                     
                            console.log("javascript message received !!!!!!!!!!")
                        } else {
                            var page = genrePageDefinition.createObject();		                                        
                            navigationPane.push(page);
                            OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayPortrait;                     
                        }
                    }
                    
                    onMinContentScaleChanged: {
                        scrollView.scrollViewProperties.minContentScale = minContentScale;
                    }
                    
                    onMaxContentScaleChanged: {
                        scrollView.scrollViewProperties.maxContentScale = maxContentScale;
                    }            
                }
            }
                            
            Slider {
                horizontalAlignment: HorizontalAlignment.Fill
                fromValue: 0
                toValue: 100                
                onValueChanged: {
                    webView.postMessage(value);
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
    
    actions: [
        ActionItem {
            id: play
            title: "Play"
            imageSource: "images/play.png"
            ActionBar.placement: ActionBarPlacement.OnBar
            onTriggered: {                
                if (isPlaying) {
                    startAnimation();                    
                    isPlaying = false;
                    imageSource = "images/pause.png";
                } else {
                    resumeAnimation();
                    isPlaying = true;
                    imageSource = "images/play.png";
                }                
            }
        }
    ]
    
    function startAnimation() {
        console.log("startAnimation !!!!!!!!!!!!!")
        webView.postMessage("play");
    }
    
    function resumeAnimation() {
        console.log("resumeAnimation !!!!!!!!!!!!!")
        webView.postMessage("pause");
    }
}
