void mouseWheel(MouseEvent event) 
{
  float e = event.getCount();
  
  if (e>0)
  {
      map.nextTile();
  }
  else
  {
      map.prevTile();
  }
}

void mouseClicked()
{
    //println("mouseClicked");
    map.setTileAt(mouseX, mouseY);  
}

void mouseDragged()
{
    //println("mouseDragged");
    map.setTileAt(mouseX, mouseY);  
}


void keyPressed()
{   
    if(key == 'f')
    {
        map.fillMap(map.getTileAtCoord(mouseX,mouseY)); 
    }
    
    if(key == 's')
    {
      selectOutput("Select a file to write to:", "fileSelected");
        map.saveToDisk(file);
    }    
    
    if(key == 'l')
    {
      selectInput("Select a file to process:", "fileSelected");
        map.loadFromDisk(file);
    }       
    
}


void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath()); 
    file = selection;
  }
}
