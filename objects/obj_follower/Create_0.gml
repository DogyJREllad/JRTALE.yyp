if(objectInstance != 0)
{
	followObject = instance_find(objectToFollow, objectInstance);
}else
{
	followObject = instance_nearest(x, y, objectToFollow);	
}