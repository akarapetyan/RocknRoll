import bb.cascades 1.0
import bb.system 1.0

Container {
    id: albumContainer
	layout: DockLayout {}
	background: Color.White
	horizontalAlignment: HorizontalAlignment.Fill
	verticalAlignment: VerticalAlignment.Fill
	
    layoutProperties: AbsoluteLayoutProperties {
        positionX: 20                      
    }
	
	Container {
	    horizontalAlignment: HorizontalAlignment.Fill
		layout: StackLayout {
			orientation: LayoutOrientation.LeftToRight
		}
	   	ImageView {
            imageSource: "asset:///images/sf_tmp.png"
            horizontalAlignment: HorizontalAlignment.Left
            verticalAlignment: VerticalAlignment.Center
            minHeight: 180
            minWidth: 180
            scalingMethod: ScalingMethod.None
        }
    
        Container {
            leftMargin: 5
            topPadding: 10
            minWidth: 500
            horizontalAlignment: HorizontalAlignment.Fill
            layout: StackLayout {
        	    orientation: LayoutOrientation.LeftToRight
			}
			
			Container {
				layout: StackLayout {}
				
				Container {
				    topPadding: 35
					Label {
			            id: nameText
			            text: ListItemData.albumName
			            textStyle {
			                fontSize: FontSize.Large
			                fontWeight: FontWeight.Bold
			            }
			        }
			    }
			}
        }
        Container {
            horizontalAlignment: HorizontalAlignment.Right
            verticalAlignment: VerticalAlignment.Center
            minWidth: 85
            minHeight: 85
            ImageView {
                horizontalAlignment: HorizontalAlignment.Right
	            imageSource: "asset:///images/sf_enter.png"
	        }
	        
	        onTouch: {
	            console.log("on enter touch !!!!!!!!!!!!!!!! ")
	            if (event.touchType == TouchType.Up) {
                    itemRoot.ListItem.view.openAlbum(ListItemData.albumName);
                }
            }
	    }
    }
    
//    attachedObjects: [
//        SystemToast {
//            id: myQmlToast
//            body: "All data will be deleted from selected album. Are you sure you want to proceed?"
//            onFinished:{
//	           Application.quit();
//	        } 
//	   }   
//    ]
    
    contextActions: [
        ActionSet {
            title: "Action Set"
            subtitle: "This is an action set."
              
            actions: [
                ActionItem {
                    title: qsTr("Delete")
                    imageSource: "asset:///images/sf_delete.png"
                    onTriggered: {
                        // Show message yes/no message box
                        dataYesNoDialog.show();
                    }
                },
                ActionItem {
                    title: qsTr("Export")
                    imageSource: "asset:///images/sf_tmp.png"
                    onTriggered: {
                                            
                    }
                }
            ]
            
            attachedObjects: [
                SystemDialog {
                    id: dataYesNoDialog
                    body: "All data will be deleted from selected album. Are you sure you want to proceed?"
                    onFinished:{
	                    if (dataYesNoDialog.result == SystemUiResult.ConfirmButtonSelection) {
	                        // Get item which user want to delete
	                        // app.dleteItem(); // remove from list on C++ side then update UI
	                        deleteToast.show(); 
	                    }
	                } 
        	    },
        	    SystemToast {
                     id: deleteToast
                     body: "Album has been deleted"
                }      
            ]
        } // end of ActionSet   
    ] // end of contextActions list
}
