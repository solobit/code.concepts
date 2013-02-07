title "UML States test"
description "Exhibition of some UML States features."
dimension 800, 768
uml = Joint.dia.uml
Joint.paper "world", 800, 768

###
Creation.
###
s1 = uml.State.create(
  rect:
    x: 100
    y: 50
    width: 100
    height: 60

  label: "created"
  attrs:
    fill: "90-#000-green:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
)

###
Serialization.
###
s2 = uml.State.create(
  rect:
    x: 220
    y: 50
    width: 100
    height: 60

  label: "stringified"
  attrs:
    fill: "90-#000-red:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
)
console.log s2.stringify()

###
Ghosting.
###
s3 = uml.State.create(
  rect:
    x: 340
    y: 50
    width: 100
    height: 60

  label: "ghosted"
  attrs:
    fill: "90-#000-yellow:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
).toggleGhosting()

###
Removal.
###
s4 = uml.State.create(
  rect:
    x: 100
    y: 130
    width: 100
    height: 60

  label: "removed"
  attrs:
    fill: "90-#000-gray:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
).remove()

###
Liquidation.
###
s5 = uml.State.create(
  rect:
    x: 220
    y: 130
    width: 100
    height: 60

  label: "liquidated"
  attrs:
    fill: "90-#000-purple:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
).liquidate()

###
Non-draggable.
###
s6 = uml.State.create(
  rect:
    x: 340
    y: 130
    width: 100
    height: 60

  label: "non-draggable"
  attrs:
    fill: "90-#000-pink:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
).draggable(false)

###
Highlight.
###
s7 = uml.State.create(
  rect:
    x: 100
    y: 210
    width: 100
    height: 60

  label: "highlight"
  attrs:
    fill: "90-#000-brown:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
).highlight()

###
Hierarchical.
###
s8 = uml.State.create(
  rect:
    x: 220
    y: 210
    width: 400
    height: 300

  label: "superstate"
  attrs:
    fill: "90-#000-gray:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
)
s81 = uml.State.create(
  rect:
    x: 230
    y: 265
    width: 260
    height: 200

  label: "embedded"
  attrs:
    fill: "90-#000-yellow:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
).embed()
s811 = uml.State.create(
  rect:
    x: 240
    y: 320
    width: 140
    height: 130

  label: "embedded"
  attrs:
    fill: "90-#000-red:1-#fff"
).embed()
s8111 = uml.State.create(
  rect:
    x: 250
    y: 350
    width: 80
    height: 40

  label: "embedded"
  attrs:
    fill: "90-#000-blue:1-#fff"
).embed()
s8112 = uml.State.create(
  rect:
    x: 250
    y: 400
    width: 80
    height: 40

  label: "embedded"
  attrs:
    fill: "90-#000-blue:1-#fff"
).embed()
s812 = uml.State.create(
  rect:
    x: 400
    y: 320
    width: 80
    height: 40

  label: "embedded"
  attrs:
    fill: "90-#000-red:1-#fff"
).embed()
console.log s8.stringify()

###
Removal.
###
s9 = uml.State.create(
  rect:
    x: 100
    y: 530
    width: 100
    height: 60

  label: "s9"
  attrs:
    fill: "90-#000-gray:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
)

###
Liquidation.
###
s10 = uml.State.create(
  rect:
    x: 300
    y: 530
    width: 100
    height: 60

  label: "s10"
  attrs:
    fill: "90-#000-purple:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
)
s11 = uml.State.create(
  rect:
    x: 300
    y: 650
    width: 100
    height: 60

  label: "s11"
  attrs:
    fill: "90-#000-purple:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
)
s12 = uml.State.create(
  rect:
    x: 100
    y: 650
    width: 100
    height: 60

  label: "s12"
  attrs:
    fill: "90-#000-purple:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
)
j910 = s9.joint(s10, uml.arrow).registerForever(s9, s10, s11, s12)
j911 = s9.joint(s11, uml.arrow).registerForever(s9, s10, s11, s12)
j912 = s9.joint(s12, uml.arrow).registerForever(s9, s10, s11, s12)
j109 = s10.joint(s9, uml.arrow).registerForever(s9, s10, s11, s12)
j1011 = s10.joint(s11, uml.arrow).registerForever(s9, s10, s11, s12)
j1012 = s10.joint(s12, uml.arrow).registerForever(s9, s10, s11, s12)
j119 = s11.joint(s9, uml.arrow).registerForever(s9, s10, s11, s12)
j1110 = s11.joint(s10, uml.arrow).registerForever(s9, s10, s11, s12)
j1112 = s11.joint(s12, uml.arrow).registerForever(s9, s10, s11, s12)
j129 = s12.joint(s9, uml.arrow).registerForever(s9, s10, s11, s12)
j1210 = s12.joint(s10, uml.arrow).registerForever(s9, s10, s11, s12)
j1211 = s12.joint(s11, uml.arrow).registerForever(s9, s10, s11, s12)
console.log j910.registeredObjects().indexOf(s9) isnt -1
console.log s9.joints().length is 6
s9.remove()
console.log j910.registeredObjects().indexOf(s9) is -1
console.log s9.joints().length is 0
console.log j1112.registeredObjects().indexOf(s12) isnt -1
console.log s12.joints().length is 6
s12.liquidate()
console.log j1112.registeredObjects().indexOf(s12) is -1
console.log s12.joints().length is 0
console.log j1112.connection() is null

###
Clonning.
###
s13 = uml.State.create(
  rect:
    x: 100
    y: 650
    width: 100
    height: 60

  label: "s13"
  attrs:
    fill: "90-#000-purple:1-#fff"

  actions:
    entry: "init()"
    exit: "destroy()"
)
s13_clone = s13.clone()
console.log s13_clone.properties.label is s13.properties.label
console.log s13_clone.properties.actions.entry is s13.properties.actions.entry
console.log s13_clone.properties.actions.exit is s13.properties.actions.exit
console.log s13_clone.euid() isnt s13.euid()

###
TODO: clone, addToolbox, toggleToolbox, removeToolbox, delInner, setWrapper, addInner,
zoomer, translate, toBack, toFront, unembed
###

###
Scale.
###

#
#var s14 = uml.State.create({
#  rect: {x: 100, y: 750, width: 100, height: 60},
#  label: "s14",
#  attrs: {
#    fill: "90-#000-green:1-#fff"
#  },
#  actions: {
#    entry: "init()",
#    exit: "destroy()"
#  }
#});
#

#var s14_str = s14.stringify();
#console.log(s14_str);
#s14.scale(2);
#var s14_scaled_str = s14.stringify();
#console.log(s14_scaled_str);

#Joint.dia.parse(s14_scaled_str);
