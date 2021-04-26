boolean loadFlag = true;

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

void mousePressed(MouseEvent event)
{
  //println("EVENT " + event);
  if (mouseButton == LEFT)
  {
    map.setTileAt(mouseX, mouseY);  
  } else if (mouseButton == RIGHT)
  {
  map.setActiveTile(map.getTileAtCoord(mouseX,mouseY)); 
  } else 
  {
     map.fillMap(map.getTileAtCoord(mouseX,mouseY)); 
  }      
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
    
    if(key == 'p')
    {
        map.setActiveTile(map.getTileAtCoord(mouseX,mouseY)); 
    }
    
    if(key == 's')
    {
        loadFlag = false;
        selectOutput("Select a file to write to:", "fileSelected");
    }    
    
    if(key == 'l')
    {
        loadFlag = true;
        selectInput("Select a file to process:", "fileSelected");
    }       
    
}


void fileSelected(File selection) {
  if (selection == null)
  {
    println("Window was closed or the user hit cancel.");
  } else
  {
    println("User selected " + selection.getAbsolutePath()); 
    file = selection;
  }
  
  if (loadFlag == true)
  {
       map.loadFromDisk(file.getAbsolutePath());  
  }
  else 
  {
       map.saveToDisk(file.getAbsolutePath());
  }
}
