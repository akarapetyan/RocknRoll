// Navigation pane project template
import bb.cascades 1.0
//import QTimer 1.0

NavigationPane {
    id: navigationPane
    
    property bool enableToClick: true
    Page {
        Container {
            layout: DockLayout {}
            
            background: back.imagePaint
            onTouch: {
                if (event.touchType == TouchType.Up) {
                    if(enableToClick) { 
                        var page = detailPageDefinition.createObject();                        
                        OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayLandscape;
                        navigationPane.push(page);                        
                    }
                }
            }
            
            attachedObjects: [
                ImagePaintDefinition {
                    id: back
                    imageSource: "images/splash.png"
                },
//                QTimer {
//                    id: image1Timer
//                    singleShot: true
//                    interval: 1000
//                    onTimeout: {                        
//                        image1Animation.play();                        
//                    }
//                },
//                QTimer {
//                    id: image2Timer
//                    singleShot: true
//                    interval: 1000
//                    onTimeout: {                        
//                        image2Animation.play();                        
//                    }
//                },
                ComponentDefinition {
                    id: appCover
                    source: "AppCover.qml"
                },
                ComponentDefinition {
                    id: detailPageDefinition
                    source: "DetailsPage.qml"
                }
            ]
            
            Container {
                layout: AbsoluteLayout {}
                horizontalAlignment: HorizontalAlignment.Left
                ImageView {
                    id: image1
                    imageSource: "images/theArt.png"
                    layoutProperties: AbsoluteLayoutProperties {
                        positionX: 768/2 - 350
                        positionY: 1280/2 - 180                   
                    }
                    
//                    translationX: 50
//                    translationY: 0 
                    
//                    animations: [
//                        TranslateTransition {
//                            id: image1Animation
//                            toY: -200                        
//                            //easingCurve: StockCurve.ExponentialIn
//                            duration: 1000
//                            
//                            onEnded: {
//                                //image2Timer.start();
//                            }     	                        
//                        }
//                    ]
                }
            
            }
            
            Container {
                layout: AbsoluteLayout {}
                horizontalAlignment: HorizontalAlignment.Right                
                layoutProperties: AbsoluteLayoutProperties {
                    positionX: 768/2 + 180
                    positionY: 1280/2 + 220                  
                }
                ImageView {
                    id: image2
                    imageSource: "images/off.png"
                    
                    
                    //                translationX: 768/2 + 40
                    //                translationY: 0                    
                    
                    //                animations: [
                    //                    TranslateTransition {
                    //                        id: image2Animation
                    //                        toY: 1280/2 + 30                     
                    //                        //easingCurve: StockCurve.ExponentialIn                            
                    //                        duration: 1000
                    //                        
                    //                        onEnded: {
                    //                            enableToClick = true;                            
                    //                        }     	                        
                    //                    }
                    //                ]
                }
            
            }

            onCreationCompleted: {
                //image1Timer.start();
            }
        }
    }
    onCreationCompleted: {
        Application.cover = appCover.createObject();
    }        
}


