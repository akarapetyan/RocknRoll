import bb.cascades 1.0
 
SceneCover {    
    content: Container {
        Container {
            layout: DockLayout {}
                        
            ImageView {
                imageSource: "images/cover.png"
            }
 
            // A container for the label text
            Container {
                bottomPadding: 31
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Bottom                
                
                Label {
                    text: "Music speaks louder than words"
                    textStyle.color: Color.create("#ebebeb")
                    textStyle.fontSize: FontSize.XXSmall
                }            
            }
        }
    }
}