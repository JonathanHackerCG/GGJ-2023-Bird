{
  "resourceType": "GMRoom",
  "resourceVersion": "1.0",
  "name": "rm_1_2",
  "creationCodeFile": "",
  "inheritCode": false,
  "inheritCreationOrder": false,
  "inheritLayers": false,
  "instanceCreationOrder": [
    {"name":"inst_5EDA670A_1_1","path":"rooms/rm_1_2/rm_1_2.yy",},
    {"name":"inst_249A02C_1_1","path":"rooms/rm_1_2/rm_1_2.yy",},
    {"name":"inst_6A5B33C6_1_1","path":"rooms/rm_1_2/rm_1_2.yy",},
    {"name":"inst_3AA41794","path":"rooms/rm_1_2/rm_1_2.yy",},
  ],
  "isDnd": false,
  "layers": [
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Tiles_1","depth":0,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":27,"SerialiseWidth":48,"TileCompressedData":[
-1296,-2147483648,],"TileDataFormat":1,},"tilesetId":{"name":"tst_tileset_1","path":"tilesets/tst_tileset_1/tst_tileset_1.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRAssetLayer","resourceVersion":"1.0","name":"Assets_1","assets":[],"depth":100,"effectEnabled":true,"effectType":null,"gridX":32,"gridY":32,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRTileLayer","resourceVersion":"1.1","name":"Collision","depth":200,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"tiles":{"SerialiseHeight":27,"SerialiseWidth":48,"TileCompressedData":[
-2,0,-26,1,-12,0,-6,1,-4,0,-26,1,-12,0,-6,1,-2,0,-2,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,
-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,
-44,0,-4,1,-44,0,-4,1,-44,0,-4,1,-44,0,-2,1,-2,0,-14,1,-12,0,-18,1,-4,0,-14,1,-12,0,-18,1,-2,0,],"TileDataFormat":1,},"tilesetId":{"name":"tst_collision","path":"tilesets/tst_collision/tst_collision.yy",},"userdefinedDepth":false,"visible":true,"x":0,"y":0,},
    {"resourceType":"GMRInstanceLayer","resourceVersion":"1.0","name":"Instances","depth":300,"effectEnabled":true,"effectType":null,"gridX":40,"gridY":40,"hierarchyFrozen":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"instances":[
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_5EDA670A_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"propertyId":{"name":"target_room","path":"objects/obj_transition/obj_transition.yy",},"value":"noone",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"propertyId":{"name":"location","path":"objects/obj_transition/obj_transition.yy",},"value":"\"left\"",},
          ],"rotation":0.0,"scaleX":2.0,"scaleY":23.0,"x":0.0,"y":80.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_249A02C_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"propertyId":{"name":"target_room","path":"objects/obj_transition/obj_transition.yy",},"value":"noone",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"propertyId":{"name":"location","path":"objects/obj_transition/obj_transition.yy",},"value":"\"right\"",},
          ],"rotation":0.0,"scaleX":2.0,"scaleY":23.0,"x":1840.0,"y":80.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_6A5B33C6_1_1","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"propertyId":{"name":"target_room","path":"objects/obj_transition/obj_transition.yy",},"value":"rm_1_1",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"propertyId":{"name":"location","path":"objects/obj_transition/obj_transition.yy",},"value":"\"bottom\"",},
          ],"rotation":0.0,"scaleX":44.0,"scaleY":2.0,"x":80.0,"y":1000.0,},
        {"resourceType":"GMRInstance","resourceVersion":"1.0","name":"inst_3AA41794","colour":4294967295,"frozen":false,"hasCreationCode":false,"ignore":false,"imageIndex":0,"imageSpeed":1.0,"inheritCode":false,"inheritedItemId":null,"inheritItemSettings":false,"isDnd":false,"objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"properties":[
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"propertyId":{"name":"target_room","path":"objects/obj_transition/obj_transition.yy",},"value":"rm_1_3",},
            {"resourceType":"GMOverriddenProperty","resourceVersion":"1.0","name":"","objectId":{"name":"obj_transition","path":"objects/obj_transition/obj_transition.yy",},"propertyId":{"name":"location","path":"objects/obj_transition/obj_transition.yy",},"value":"\"top\"",},
          ],"rotation":0.0,"scaleX":44.0,"scaleY":2.0,"x":80.0,"y":0.0,},
      ],"layers":[],"properties":[],"userdefinedDepth":false,"visible":true,},
    {"resourceType":"GMRBackgroundLayer","resourceVersion":"1.0","name":"Background","animationFPS":15.0,"animationSpeedType":0,"colour":4293322470,"depth":400,"effectEnabled":true,"effectType":null,"gridX":16,"gridY":16,"hierarchyFrozen":false,"hspeed":0.0,"htiled":false,"inheritLayerDepth":false,"inheritLayerSettings":false,"inheritSubLayers":true,"inheritVisibility":true,"layers":[],"properties":[],"spriteId":null,"stretch":false,"userdefinedAnimFPS":false,"userdefinedDepth":false,"visible":true,"vspeed":0.0,"vtiled":false,"x":0,"y":0,},
  ],
  "parent": {
    "name": "Rooms",
    "path": "folders/Rooms.yy",
  },
  "parentRoom": null,
  "physicsSettings": {
    "inheritPhysicsSettings": false,
    "PhysicsWorld": false,
    "PhysicsWorldGravityX": 0.0,
    "PhysicsWorldGravityY": 10.0,
    "PhysicsWorldPixToMetres": 0.1,
  },
  "roomSettings": {
    "Height": 1080,
    "inheritRoomSettings": false,
    "persistent": false,
    "Width": 1920,
  },
  "sequenceId": null,
  "views": [
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
    {"hborder":32,"hport":720,"hspeed":-1,"hview":720,"inherit":false,"objectId":null,"vborder":32,"visible":false,"vspeed":-1,"wport":1280,"wview":1280,"xport":0,"xview":0,"yport":0,"yview":0,},
  ],
  "viewSettings": {
    "clearDisplayBuffer": true,
    "clearViewBackground": false,
    "enableViews": false,
    "inheritViewSettings": false,
  },
  "volume": 1.0,
}