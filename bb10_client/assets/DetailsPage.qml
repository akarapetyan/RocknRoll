// Navigation pane project template
import bb.cascades 1.0

Page {
    // page with a picture detail
    id: pgDetail
    
    property bool isPlaying: false
    property bool isBubbleClicked : true
    
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
                    
//                    onMessageReceived: {
//                        console.log("message.data ======== " + message.data)
//                        if(message.data === "" || message.data == null) {
//                            isBubbleClicked = false;
//                            console.log("javascript message received !!!!!!!!!!")
//                        } else {
//                            isBubbleClicked = true;
//                        }
//                    }
//                    onTouch: {
//                        if(isBubbleClicked) {
//	                        if(TouchType.Up == event.touchType) {
//	                            var page = genrePageDefinition.createObject();		                                        
//	                            navigationPane.push(page);
//	                            OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayPortrait;
//	                        }
//                        }
//                    }
                    
                    onMinContentScaleChanged: {
                        scrollView.scrollViewProperties.minContentScale = minContentScale;
                    }
                    
                    onMaxContentScaleChanged: {
                        scrollView.scrollViewProperties.maxContentScale = maxContentScale;
                    }            
                }
                
                onTouch: {
                    console.log("onTouch !!!!!!!!!!!! ")
                    if(pgDetail.isBubbleClicked) {
                        console.log("onTouch 11111111 !!!!!!!!!!!! ")
                        if(TouchType.Up == event.touchType) {
                            console.log("onTouch 2222222222 !!!!!!!!!!!! ")
                            var page = genrePageDefinition.createObject();		                                        
                            navigationPane.push(page);
                            OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayPortrait;
                        }
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
