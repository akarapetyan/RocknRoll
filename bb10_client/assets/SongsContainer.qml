import bb.cascades 1.0
import bb.system 1.0

Container {    
    id: albumContainer
	layout: DockLayout {}
	background: back.imagePaint
	horizontalAlignment: HorizontalAlignment.Fill
	verticalAlignment: VerticalAlignment.Fill
	minWidth: 768
	maxWidth: 768
	
    layoutProperties: AbsoluteLayoutProperties {
        positionX: 20                      
    }
	
	Container {
	    horizontalAlignment: HorizontalAlignment.Fill
		layout: StackLayout {
			orientation: LayoutOrientation.LeftToRight
		}
		
        Container {
            leftPadding: 10
            ImageView {
                imageSource: "asset:///images/sol.png"
                horizontalAlignment: HorizontalAlignment.Left
                verticalAlignment: VerticalAlignment.Center
                scalingMethod: ScalingMethod.None
            }        
        }
            
        Container {
            leftMargin: 5
            topPadding: 10
            minWidth: 660
            horizontalAlignment: HorizontalAlignment.Fill
            layout: StackLayout {
        	    orientation: LayoutOrientation.LeftToRight
			}
			
			Container {
				layout: StackLayout {}
				
				Container {
				    topPadding: 15
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
            ImageView {
                horizontalAlignment: HorizontalAlignment.Right
	            imageSource: "asset:///images/sf_enter.png"
	        }
	        
	        onTouch: {	            
	            if (event.touchType == TouchType.Up) {
                    itemRoot.ListItem.view.openAlbum(ListItemData.albumName);
                }
            }
	    }
    }
    attachedObjects: [
        ImagePaintDefinition {
            id: back
            imageSource: "images/row.png"
        }
    ]
}
