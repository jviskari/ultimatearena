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
}
