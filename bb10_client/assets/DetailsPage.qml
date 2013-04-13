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
            ScrollView {
                id: scrollView
                
                horizontalAlignment: HorizontalAlignment.Fill
                verticalAlignment: VerticalAlignment.Fill
                scrollViewProperties.pinchToZoomEnabled: true
                scrollViewProperties.scrollMode: ScrollMode.Both
                WebView {
                    id: webView
                    url: "local:///assets/web/test.html"
                    
                    onMessageReceived: {
                        if(!message.data.length) {
                            console.log("javascript message received !!!!!!!!!!")
                        }
                        //titleLabel.setText("Data from JS: " + message.data);
                        //push to needed page
                        //	                   var page = genrePageDefinition.createObject();		                                        
                        //	                   navigationPane.push(page);
                    }
                    
                    onMinContentScaleChanged: {
                        scrollView.scrollViewProperties.minContentScale = minContentScale;
                    }
                    
                    onMaxContentScaleChanged: {
                        scrollView.scrollViewProperties.maxContentScale = maxContentScale;
                    }            
                }
                onTouch: {
                    if(TouchType.Up == event.touchType) {
                        var page = genrePageDefinition.createObject();		                                        
                        navigationPane.push(page);
                        OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayPortrait;
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
                    imageSource = "images/play.png";
                } else {
                    resumeAnimation();
                    isPlaying = true;
                    imageSource = "images/pause.png";
                }
                webView.postMessage("play");
            }
        }
    ]
    
    function startAnimation() {
        console.log("startAnimation !!!!!!!!!!!!!")
    }
    
    function resumeAnimation() {
        console.log("resumeAnimation !!!!!!!!!!!!!")
    }
}
