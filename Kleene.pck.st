'From Cuis 6.0 [latest update: #6053] on 18 December 2023 at 10:58:48 pm'!
'Description '!
!provides: 'Kleene' 1 14!
!requires: 'Gaudi' 1 0 nil!
SystemOrganization addCategory: #Kleene!


!classDefinition: #ArcMorph category: #Kleene!
BoxedMorph subclass: #ArcMorph
	instanceVariableNames: 'angle direction lineWidth arrow arrowHeadLength'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'ArcMorph class' category: #Kleene!
ArcMorph class
	instanceVariableNames: ''!

!classDefinition: #QuadraticBezier category: #Kleene!
BoxedMorph subclass: #QuadraticBezier
	instanceVariableNames: 'start end control curveWidth arrow arrowHeadLength'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'QuadraticBezier class' category: #Kleene!
QuadraticBezier class
	instanceVariableNames: ''!

!classDefinition: #StateMorph category: #Kleene!
BoxedMorph subclass: #StateMorph
	instanceVariableNames: 'label accepting font textColor'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'StateMorph class' category: #Kleene!
StateMorph class
	instanceVariableNames: ''!

!classDefinition: #WhiteboardMorph category: #Kleene!
BoxedMorph subclass: #WhiteboardMorph
	instanceVariableNames: 'shapes whiteboard'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'WhiteboardMorph class' category: #Kleene!
WhiteboardMorph class
	instanceVariableNames: ''!

!classDefinition: #StateDiagramTest category: #Kleene!
TestCase subclass: #StateDiagramTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'StateDiagramTest class' category: #Kleene!
StateDiagramTest class
	instanceVariableNames: ''!

!classDefinition: #TestCircle category: #Kleene!
TestCase subclass: #TestCircle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'TestCircle class' category: #Kleene!
TestCircle class
	instanceVariableNames: ''!

!classDefinition: #KleeneViewer category: #Kleene!
GaudiViewer subclass: #KleeneViewer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'KleeneViewer class' category: #Kleene!
KleeneViewer class
	instanceVariableNames: ''!

!classDefinition: #Circle category: #Kleene!
Object subclass: #Circle
	instanceVariableNames: 'center radius'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'Circle class' category: #Kleene!
Circle class
	instanceVariableNames: ''!

!classDefinition: #DiagramSelfTransition category: #Kleene!
Object subclass: #DiagramSelfTransition
	instanceVariableNames: 'state label magnet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'DiagramSelfTransition class' category: #Kleene!
DiagramSelfTransition class
	instanceVariableNames: ''!

!classDefinition: #DiagramState category: #Kleene!
Object subclass: #DiagramState
	instanceVariableNames: 'adj position accepting initial label radius'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'DiagramState class' category: #Kleene!
DiagramState class
	instanceVariableNames: ''!

!classDefinition: #DiagramTransition category: #Kleene!
Object subclass: #DiagramTransition
	instanceVariableNames: 'origin paths destination labels'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'DiagramTransition class' category: #Kleene!
DiagramTransition class
	instanceVariableNames: ''!

!classDefinition: #StateDiagram category: #Kleene!
Object subclass: #StateDiagram
	instanceVariableNames: 'states initialState transitions transitionIndex selfTransitions properties title'
	classVariableNames: 'Defaults'
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'StateDiagram class' category: #Kleene!
StateDiagram class
	instanceVariableNames: ''!

!classDefinition: #Whiteboard category: #Kleene!
Object subclass: #Whiteboard
	instanceVariableNames: 'window viewport transform'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'Whiteboard class' category: #Kleene!
Whiteboard class
	instanceVariableNames: ''!


!ArcMorph methodsFor: 'accessing' stamp: 'DF 12/8/2020 19:23:43'!
angle: anAngle
	angle _ anAngle! !

!ArcMorph methodsFor: 'accessing' stamp: 'DF 12/8/2020 20:12:48'!
direction: anAngle

	direction _ anAngle! !

!ArcMorph methodsFor: 'accessing' stamp: 'DF 11/15/2021 16:58:54'!
end
	^self morphExtent / 2 + (Point r:self radius degrees:  180 + direction + angle).
! !

!ArcMorph methodsFor: 'accessing' stamp: 'DF 12/8/2020 19:23:52'!
lineWidth: aNumber
	lineWidth _ aNumber! !

!ArcMorph methodsFor: 'accessing' stamp: 'DF 11/17/2021 18:49:42'!
radius

	| radius |
	
	radius _ (self morphLocalBounds width min: self morphLocalBounds height) / 2 - (lineWidth * 2).

	^radius.
! !

!ArcMorph methodsFor: 'accessing' stamp: 'DF 11/15/2021 16:58:47'!
start
	^self morphExtent / 2 + (Point r: self radius degrees:  180 + direction).
! !

!ArcMorph methodsFor: 'drawing' stamp: 'DF 11/17/2021 18:48:54'!
drawOn: aCanvas
	
	aCanvas strokeWidth: lineWidth color: color do:[
		aCanvas moveTo: self  start ; arcTo: self end radius: self radius angleOfXAxis: 0 largeFlag: true sweepFlag: true ].
! !

!ArcMorph methodsFor: 'initialization' stamp: 'DF 11/15/2021 16:54:09'!
initialize

	super initialize.

	direction _ 0. "0 is north".
	
	angle _ 360.
	
	lineWidth _ 2.
! !

!ArcMorph methodsFor: 'geometry testing' stamp: 'DF 12/8/2020 19:40:35'!
morphContainsPoint: aLocalPoint
	
	^self morphLocalBounds containsPoint: aLocalPoint
! !

!ArcMorph methodsFor: 'as yet unclassified' stamp: 'DF 11/24/2021 14:24:55'!
requiresVectorCanvas
	^true! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/14/2021 18:52:28'!
arrow: aBoolean
	arrow _ aBoolean! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/14/2021 18:52:51'!
arrowHeadLength: aNumber
	arrowHeadLength _ aNumber ! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/29/2023 19:14:22'!
control
	^control! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/14/2021 18:41:10'!
control: aPoint
	control _ aPoint! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/14/2021 18:48:12'!
curveWidth: aNumber
	curveWidth _ aNumber
	! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/24/2021 14:50:53'!
drawArrowOn: aCanvas

	| lineDirection |

	lineDirection _ (end - control) normalized.
		
	aCanvas
		line: end
		to: end - (Point r: arrowHeadLength degrees: (lineDirection degrees - 30))
		width: curveWidth
		color: color.
			
	aCanvas
		line: end
		to: end - (Point r: arrowHeadLength degrees: (lineDirection degrees + 30))
		width: curveWidth
		color: color.
	! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/29/2023 19:26:12'!
drawOn: aCanvas
"
	aCanvas
		fillRectangle: self morphLocalBounds
		color: Color lightBlue
		borderWidth: borderWidth
		borderStyleSymbol: #simple
		baseColorForBorder: borderColor.
	"	
	aCanvas 	strokeWidth: curveWidth color: self color do:[
		aCanvas moveTo: start;			quadraticBezierTo: end control: control].
	
	arrow ifTrue:[self drawArrowOn: aCanvas].! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/29/2023 19:14:18'!
end
	^end
	! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/14/2021 18:41:03'!
end: aPoint
	end _ aPoint! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/14/2021 18:58:10'!
initialize

	super initialize.
	
	start _ `0@0`.
	end _ `1@01`.
	control _ `1@1`.
	curveWidth _ 1.
	arrow _ false.
	arrowHeadLength _ 8.
	! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/24/2021 14:22:59'!
requiresVectorCanvas
	^true! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/29/2023 19:14:15'!
start
	^start! !

!QuadraticBezier methodsFor: 'as yet unclassified' stamp: 'DF 11/14/2021 18:40:59'!
start: aPoint
	start _ aPoint! !

!StateMorph methodsFor: 'as yet unclassified' stamp: 'DF 11/16/2021 17:47:22'!
accepting: aBoolean
	accepting _ aBoolean! !

!StateMorph methodsFor: 'as yet unclassified' stamp: 'DF 11/29/2023 19:26:01'!
drawOn: aCanvas 

	| rx ry labelExtent labelBounds |
	
	"super drawOn: aCanvas."
	
	rx := extent x //2.
	ry := extent y // 2.
	
	aCanvas ellipseCenter: rx @ ry radius: rx @ ry borderWidth: borderWidth borderColor: borderColor fillColor: color.

	accepting ifTrue:[
		aCanvas ellipseCenter: rx @ ry radius: 0.8* rx @ (0.8 * ry) borderWidth: borderWidth borderColor: borderColor fillColor: color.
	].
	
	labelExtent := ((font widthOfString: label) max: 3)  @ font lineSpacing.
	
	labelBounds := `0@0` extent: labelExtent. 
	
	labelBounds := labelBounds aligned: labelBounds center with: self morphLocalBounds center.
	
	aCanvas drawString: label at: labelBounds origin font: font color: textColor.
	
	! !

!StateMorph methodsFor: 'as yet unclassified' stamp: 'DF 11/16/2021 17:52:32'!
font: aFont

	font _ aFont! !

!StateMorph methodsFor: 'as yet unclassified' stamp: 'DF 11/29/2023 17:59:44'!
initialize

	super initialize.

	accepting := false.
	
	font := FontFamily defaultFamilyAndPointSize.
	
	textColor := Color black.
	
	label := ''.! !

!StateMorph methodsFor: 'as yet unclassified' stamp: 'DF 11/16/2021 17:47:07'!
label: aString
	label _ aString! !

!StateMorph methodsFor: 'as yet unclassified' stamp: 'DF 11/24/2021 14:25:21'!
requiresVectorCanvas
	^true! !

!StateMorph methodsFor: 'as yet unclassified' stamp: 'DF 11/16/2021 17:59:15'!
textColor: aColor
	textColor _ aColor! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 13:35:35'!
addShape: aShape
	shapes add: aShape! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 13:52:52'!
drawOn: aCanvas

	super drawOn: aCanvas.
	
	shapes do:[:each | each drawOn: whiteboard canvas: aCanvas ] ! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 13:49:52'!
initialize

	super initialize.
	shapes := OrderedCollection new.! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 21:47:32'!
removeAllShapes

	shapes removeAll! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 15:12:57'!
requiresVectorCanvas
	^true! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/16/2023 20:44:03'!
whiteboard
	^whiteboard! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 13:36:09'!
whiteboard: aWhiteboard
	whiteboard := aWhiteboard! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 17:16:11'!
zoomIn

	whiteboard zoomIn. 
	
	self redrawNeeded.! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 17:16:18'!
zoomOut

	whiteboard zoomOut.
	
	self redrawNeeded.! !

!WhiteboardMorph methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 19:58:06'!
zoomToFitAll
	
	| a origin c |
	
	a := self owner viewableArea.
	
	origin := self internalize: a origin.
	c := self internalize: a corner.
	
	whiteboard viewport: (origin corner:c).​ 
	
	self redrawNeeded.
! !

!StateDiagramTest methodsFor: 'as yet unclassified' stamp: 'DF 12/14/2023 21:07:00'!
testIsConnected

	| a b c aStateDiagram |
	
	a := DiagramState new label:'a'; yourself.
	
	b := DiagramState new label:'b' ; yourself.
	
	c := DiagramState new label:'c';  accepting: true; yourself.

	aStateDiagram := StateDiagram new.

	aStateDiagram addState: a; addState:b ; addState:c.

	aStateDiagram setInitialState: a.
		
	aStateDiagram connect: a to: b 	label: 'open'.
	aStateDiagram connect: b to: a 	label: 'swap'.
	aStateDiagram connect: a to: a 	label: 'self'.
	aStateDiagram connect: b to: c 	label: 'done'.
	aStateDiagram connect: b to: c 	label: 'close'.
	aStateDiagram connect: a to: c 	label: 'insert'.

	self assert: aStateDiagram isConnected
	! !

!StateDiagramTest methodsFor: 'as yet unclassified' stamp: 'DF 12/14/2023 21:07:12'!
testNotConnected

	| a b c aStateDiagram |
	
	a := DiagramState new label:'a'; yourself.
	
	b := DiagramState new label:'b' ; yourself.
	
	c := DiagramState new label:'c';  accepting: true; yourself.

	aStateDiagram := StateDiagram new.
		
	aStateDiagram addState: a; addState:b ; addState:c.

	aStateDiagram setInitialState: a.
		
	aStateDiagram connect: a to: b 	label: 'open'.
	aStateDiagram connect: b to: a 	label: 'swap'.
	aStateDiagram connect: a to: a 	label: 'self'.
	aStateDiagram connect: c to: b 	label: 'done'.

	self assert: aStateDiagram isConnected equals: false
	! !

!TestCircle methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 21:55:59'!
testIntersection

	| c1 c2 c3 c4 |
	
	c1 := Circle new center: 0@0 ; radius: 1.0 ; yourself.
	
	c2 := Circle new center: 1.5@0 ; radius: 0.5; yourself.
	
	self assert: (c1 intersection: c2) equals: { 1.0 @ 0.0 } asOrderedCollection.
	
	c3 := Circle new center: 0@1.5 ; radius: 0.5; yourself.

	self assert: ((c1 intersection: c3) at:1) x abs < 1e-9.
	
	self assert: ((c1 intersection: c3) at:1) y isCloseTo: 1.0.
	
	c4 := Circle new center: 1.5@0 ; radius: 1.0; yourself.

	self assert: (c1 intersection: c4) equals: { 0.75 @ (1 - 0.75 squared) sqrt . 0.75 @ (0 - (1 - 0.75 squared) sqrt) } asOrderedCollection.
! !

!KleeneViewer class methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 22:03:51'!
open: model label: aString

	| viewport a aWhiteboard aWhiteboardMorph aScrollPane aColumnMorph aRowMorph  aWindow |

	model layoutDiagram.

	aWhiteboard := Whiteboard new.
	
	aWhiteboardMorph := WhiteboardMorph new.
	
	aWhiteboardMorph whiteboard: aWhiteboard; color: Color veryVeryLightGray.

	aWhiteboardMorph morphExtent: 3000@2000.
	
	aScrollPane := GaudiViewerMorph new.
	
	aScrollPane model: model ; scroller: aWhiteboardMorph.
	
	aColumnMorph := LayoutMorph newColumn.
	
	aColumnMorph addMorph: (self buildToolBar: aWhiteboardMorph).
	
	aRowMorph := LayoutMorph newRow.
	
	aRowMorph addMorph: aScrollPane proportionalWidth:0.8.
	
	aRowMorph addMorph: (LabelGroup with: {
		'radius' -> (SimpleNumberEntryMorph positiveFloatDefault: model getStateRadius maxNumChars:4 :: valueUpdator: [ :value | model setStateRadius: value]; yourself). 
		'charge' -> (SimpleNumberEntryMorph positiveFloatDefault: model getStateCharge maxNumChars:4 :: valueUpdator: [ :value | model setStateCharge: value]; yourself). 
		'length' -> (SimpleNumberEntryMorph positiveFloatDefault: model getTransitionLength maxNumChars:4 :: valueUpdator:[ :value | model setTransitionLength: value]; yourself). 
		'strength' -> (SimpleNumberEntryMorph positiveFloatDefault: model getTransitionStrength maxNumChars:4 :: valueUpdator:[ :value | model setTransitionLength: value]; yourself).
		'debug' -> (CheckButtonMorph new selected: false  ; yourself).
	}) proportionalWidth:0.2.
	
	aColumnMorph addMorph: aRowMorph.
	
	aWindow := aColumnMorph embeddedInMorphicWindowLabeled: 'Kleene Viewer: ', model defaultDiagramName.

	aWindow openInWorld.
	
	a := aScrollPane viewableArea.
	
	viewport := a aligned: a center with: aWhiteboardMorph morphExtent / 2.
	
	aWhiteboard window: model window viewport: viewport.
	
	aScrollPane scrollToShow: viewport.
	
	model drawOn: aWhiteboardMorph.

! !

!Circle methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 21:42:14'!
center
	^center! !

!Circle methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 21:42:11'!
center: aPoint
	center := aPoint! !

!Circle methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 21:46:11'!
intersection: aCircle

	| d pts x delta h | 
	
	pts := OrderedCollection new.
	
	" first calculate the intersection points assuming self is centered at 0,0 and aCircle lies on the x axis"
	
	d := center dist: aCircle center.
	
	self assert: d abs > (1e-6 * radius). "they must not be too close to each other".
	
	x := (d squared + radius squared - aCircle radius squared) / (2 * d ).
	
	delta := radius squared - x squared.
	
	delta < 0 ifTrue:[^pts]. "no intersection"
	
	h := (radius squared - x squared) sqrt.
	
	pts add: x @ h.
	
	delta > (1e-6 * radius)
		ifTrue:[ pts add: x @(0 - h)  ].

	"now rotate and translate the two points back to the actual position of the circles "
	
	^pts collect:[:each | each rotatedBy: (aCircle center - center) theta :: translatedBy: center ]
	! !

!Circle methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 21:42:24'!
radius
	^radius! !

!Circle methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 21:42:21'!
radius: aNumber
	radius := aNumber! !

!DiagramSelfTransition methodsFor: 'accessing' stamp: 'DF 12/15/2020 18:49:08'!
label: aString
	label _ aString! !

!DiagramSelfTransition methodsFor: 'accessing' stamp: 'DF 3/7/2023 23:00:50'!
state
	^state! !

!DiagramSelfTransition methodsFor: 'accessing' stamp: 'DF 12/15/2020 18:49:02'!
state: aDiagramState
	state _ aDiagramState! !

!DiagramSelfTransition methodsFor: 'morphic' stamp: 'DF 12/14/2023 21:04:37'!
asMorph: aTransform with: properties 

	| alpha anArcMorph extent anArrowMorph origin aLabelMorph radius |
	
	radius := properties at:#state_radius.
	
	alpha := (magnet position - state position) degrees.
		
	extent := aTransform scale * 2 * (radius @ radius).
	
	anArcMorph := ArcMorph new angle:270 ; direction: alpha + 45; morphExtent: extent; lineWidth:(properties at: #transition_morph_width); color: (properties at:#transition_morph_color); yourself.
	
	origin := (anArcMorph start + anArcMorph end) / 2.
	
	anArcMorph morphPosition: 	(aTransform transform: magnet position) - origin.

	anArrowMorph := SimpleLineMorph new lineWidth:(properties at: #transition_morph_width) ; color: (properties at:#transition_morph_color); startPoint: anArcMorph end; endPoint: (Point r:1 degrees: alpha+ 60 + 180) ; arrow: true; arrowHeadLength: (properties at: #transition_morph_arrow_length); yourself.
	
	anArcMorph addMorph: anArrowMorph.
	
	aLabelMorph := LabelMorph new contents: label ; yourself.
	
	aLabelMorph font: (properties at: #transition_label_font).
	
	aLabelMorph  morphPosition: (Point r: extent x degrees: alpha) + origin.
	
	anArcMorph addMorph: aLabelMorph.
	
	(properties at:#debug_self_transition_labels) ifTrue:[
		anArcMorph addMorph: (SimpleLineMorph new lineWidth:1 ; color: Color red; startPoint: origin; endPoint: (Point r: extent x degrees: alpha); arrow: true; yourself)].
	
	^anArcMorph ! !

!DiagramSelfTransition methodsFor: 'morphic' stamp: 'DF 12/18/2023 22:48:06'!
layoutIn: aForceSolver around: magnets with: properties 

	| radius anchor spring index maxa maxi a p |

	radius := properties at:#state_radius.
	
	index := 1.

	maxa := 0.
	maxi := 1.
			
	[index < magnets size] 
		whileTrue:[	
			a := ((magnets at:index + 1) position theta - (magnets at:index) position theta) abs.
			maxa < a ifTrue:[
				maxi := index. maxa := a].
			index := index + 1 ].
	
	a := 	((magnets at: 1) position theta - (magnets at:index) position theta) abs.
	maxa < a ifTrue:[
		maxi := index. maxa := a].
	
	p := Point rho: radius theta: (magnets at:maxi) position theta + (maxa / 2).
	
	anchor := Anchor new position: state position; yourself.
	
	magnet := Magnet new charge: (properties at:#self_transition_magnet_charge); position: state position + (p) ; yourself.

	spring := Spring length: radius * 1.5 strength: (properties at:#self_transition_spring_strength) between: anchor and: magnet.
	
	aForceSolver addObject: anchor; addObject: magnet; addConstraint: spring.
! !

!DiagramSelfTransition methodsFor: 'morphic' stamp: 'DF 12/14/2023 21:05:07'!
layoutIn: aForceSolver with: properties 

	| anchor spring radius |

	radius := properties at:#state_radius.
		
	anchor := Anchor new position: state position; yourself.
	
	magnet := Magnet new charge: (properties at:#self_transition_magnet_charge); position: state position + ( radius @ 0) ; yourself.

	spring := Spring length: (properties at:#self_transition_spring_length_factor) *  radius strength: (properties at:#self_transition_spring_strength) between: anchor and: magnet.
	
	aForceSolver addObject: anchor; addObject: magnet; addConstraint: spring.
! !

!DiagramSelfTransition methodsFor: 'shapes' stamp: 'DF 12/18/2023 22:51:22'!
drawOn: aWhiteboard canvas: aCanvas

	| p pts c1 c2 r |
	
	p := state position + ((magnet position - state position) * 1.3).
	r := state radius * 1.
	
	aWhiteboard drawOn: aCanvas circleCenter: p radius: r borderWidth: 1 borderColor: Color black fillColor: Color transparent.
	
	c1 := Circle new center: state position ; radius: state radius ; yourself.
	c2 := Circle new center: p; radius: r ; yourself.
	
	pts := c1 intersection: c2.
	
	"pts do:[:each | aWhiteboard drawOn: aCanvas circleCenter: each radius: 0.1* state radius borderWidth:1 borderColor: Color blue fillColor: Color blue]."
	
	pts ifEmpty:[^self].

	aWhiteboard drawOn: aCanvas arrowHead: 8 at: pts first direction: (pts first - p) normal width:1 color: Color black.
	
	"aWhiteboard drawOn: aCanvas circleCenter: magnet position radius: 0.2* state radius borderWidth:1 borderColor: Color blue fillColor: Color red "! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/13/2020 15:17:24'!
accepting: aBoolean
	accepting _ aBoolean! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/4/2021 16:01:34'!
addNeighbour: aState
	adj add: aState! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/4/2021 16:02:06'!
adj
	^adj! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 1/16/2021 12:05:49'!
initial: aBoolean
	initial _ aBoolean! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/13/2020 14:54:37'!
label: aString
	label _ aString! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/13/2020 14:52:10'!
position
	^position! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/13/2020 14:52:20'!
position: aPoint
	position _ aPoint! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/18/2023 22:05:10'!
radius
	^radius! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/15/2023 14:44:46'!
radius: aNumber
	radius := aNumber! !

!DiagramState methodsFor: 'morphic' stamp: 'DF 12/15/2023 12:10:56'!
asMorph: aTransform with: properties 

	| aStateMorph color scale radius |

	radius := properties at:#state_radius.
	
	scale := aTransform scale * 2 * radius.

	aStateMorph := StateMorph new.
	
	aStateMorph morphExtent: scale @ scale ; morphPosition: (aTransform transform: position - (radius@radius)).
	
	color := initial ifTrue:[ properties at:#initial_state_morph_color ] ifFalse:[ properties at:#state_morph_color].
	
	aStateMorph color: color; borderWidth: (properties at:#state_border_width); borderColor: (properties at:#state_border_color).
	
	aStateMorph label: label ; accepting: accepting.
	
	aStateMorph font: (properties at:#state_morph_font); textColor: (properties at:#state_morph_label_color).
	
	^aStateMorph.
	
! !

!DiagramState methodsFor: 'initialization' stamp: 'DF 12/15/2023 14:44:18'!
initialize

	adj := Set new.
	accepting := false.
	initial := false.
	radius := 1.
	
! !

!DiagramState methodsFor: 'shapes' stamp: 'DF 12/15/2023 22:12:30'!
drawOn: aWhiteboard canvas: aCanvas

	| font |
		
	aWhiteboard drawOn: aCanvas circleCenter: position radius: radius borderWidth: 1 borderColor: Color black fillColor: Color yellow.
	
	accepting ifTrue:[
		aWhiteboard drawOn: aCanvas circleCenter: position radius: 0.8 * radius borderWidth: 1 borderColor: Color black fillColor: Color yellow.
	].

	initial ifTrue:[ | p1 p2 |
	
		p2 := position - (radius@0).

		p1 := p2 - (Point r:radius degrees: 30).
	
		aWhiteboard drawOn: aCanvas  lineFrom: p1 to: p2 width:3 color: Color red.
		
		aWhiteboard drawOn: aCanvas arrowHead: 8 at: p2 direction: (p2 - p1) width: 3 color: Color red
	].

	font :=FontFamily defaultFamilyPointSize:9.
		
	aWhiteboard drawOn: aCanvas string: label at: position font: font color: Color black.
! !

!DiagramTransition methodsFor: 'initialization' stamp: 'DF 12/3/2021 19:43:04'!
initialize

	paths _ OrderedCollection new.
	
	labels _ OrderedCollection new.
	
! !

!DiagramTransition methodsFor: 'morphic' stamp: 'DF 12/3/2021 19:56:45'!
asMorph: aTransform with: properties 

	^(1 to: paths size) collect:[:index |
		self pathAt: index asMorph: aTransform with:properties].
	
	! !

!DiagramTransition methodsFor: 'morphic' stamp: 'DF 12/14/2023 19:55:00'!
pathAt: index asMorph: aTransform with: properties 

	| aMorph mpath rect aLabelMorph direction theta length d delta |
	
	aMorph := QuadraticBezier new.
	
	aMorph color: (properties at: #transition_morph_color); curveWidth: (properties at: #transition_morph_width); arrow:true.
	
	mpath := (paths at:index) collect:[:each | aTransform transform: each position ].

	rect := Rectangle encompassing: mpath.
	
	aMorph morphPosition: rect origin ; morphExtent: rect extent.
		
	aMorph start: (mpath at:1) - rect origin ; control: (mpath at:2) - rect origin  ; end: (mpath at:3) - rect origin.
	
	direction := (mpath at:3) - (mpath at:2).

	theta := direction normal theta.
		
	aLabelMorph := LabelMorph new contents: (labels at:index) ; yourself.
	
	aLabelMorph font: (properties at: #transition_label_font).
	
	length := ((aLabelMorph morphExtent x * 0.6 * (theta cos)) squared + ((aLabelMorph morphExtent y * (theta sin)) squared)) raisedTo:0.5.
	
	d := 0.4.
	
	delta := d / paths size.
	
	aLabelMorph  morphPosition: (mpath at:2) + (((mpath at:3) - (mpath at:2)) * (properties at:#transition_label_relative_position) * (1 - ((index - 1) * delta) ) ) + (direction normal * length) - (aLabelMorph morphExtent  / 2) - rect origin.
		
	aMorph addMorph: aLabelMorph.

	(properties at: #debug_labels)	 ifTrue:[ | aLineMorph |
		aLineMorph := SimpleLineMorph new startPoint: (mpath at:2) + (((mpath at:3) - (mpath at:2)) * (properties at:#transition_label_relative_position)) - rect origin ; endPoint: (direction normal * length) ; lineWidth: 3;yourself.
	
		aLineMorph color: Color red.
	
		aMorph addMorph: aLineMorph.
	].
	
	^aMorph! !

!DiagramTransition methodsFor: 'layout' stamp: 'DF 12/3/2021 19:49:57'!
layoutIn: aForceSolver with: properties 

	(1 to: paths size) do:[:index |	
		self layoutPathAt: index In: aForceSolver with: properties].
! !

!DiagramTransition methodsFor: 'layout' stamp: 'DF 12/15/2023 11:42:51'!
layoutPathAt: index In: aForceSolver with: properties 
	
	| radius aPath destinationAnchor originAnchor originMagnet midMagnet destinationMagnet direction distance offset alpha beta centralOffset charge strength |
	
	radius := properties at:#state_radius.
	
	charge := 0.015 * (properties at:#state_charge).
	
	strength := 0.3 * (properties at:#state_layout_spring_strength).
	
	offset := index - ((paths size + 1) / 2).	

	aPath := paths at:index.
	
	aPath removeAll.
	
	direction := destination position - origin position.

	distance := direction r.
	
	direction := direction normalized.
		
	"we create an anchor for the origin and destination positions"
	
	originAnchor := Anchor position: origin position.

	aForceSolver addObject: originAnchor.
	
	destinationAnchor := Anchor position: destination position.

	aForceSolver addObject: destinationAnchor.

	" each anchor is connected to a stick (a very strong spring) with a radius that is equal to the radius of the origin/destination"

	alpha := (offset = 0) ifTrue:[ 3 ] ifFalse: [(properties at:#transition_origin_separation_angle) * offset ].
	
	originMagnet := Magnet 	charge: charge position: origin position + ((direction * radius) rotatedBy: alpha degreesToRadians).

	aPath add: originMagnet.
		
	aForceSolver addObject: originMagnet.
	
	aForceSolver addConstraint: (Spring length: radius strength:10 * strength between:originAnchor and: originMagnet).

	centralOffset := (offset = 0) ifTrue:[ 0.125 ] ifFalse:[0].

	midMagnet := Magnet 	charge: charge position: origin position + (direction * distance / 2 ) + (direction normal * (offset + centralOffset) ).

	aForceSolver addObject: midMagnet.

	aPath add: midMagnet.

	"self buildLabelIn: aForceSolver attachedTo: midMagnet."

	beta := (offset = 0) ifTrue:[ -3 ] ifFalse: [(properties at:#transition_destination_separation_angle) * offset ].
	
	destinationMagnet := Magnet 	charge:charge position: destination position - ((direction * radius) rotatedBy: beta degreesToRadians). .

	aForceSolver addObject: destinationMagnet.

	aPath add: destinationMagnet.
	
	aForceSolver addConstraint: (Spring length: (1.0 * radius) strength: 10 * strength between:destinationMagnet and: destinationAnchor).

	aForceSolver addConstraint: (Spring length: distance * (5/16) strength: strength between: originMagnet and: midMagnet).

	aForceSolver addConstraint: (Spring length: distance * (5/16) strength: strength between: midMagnet and: destinationMagnet).
! !

!DiagramTransition methodsFor: 'accessing' stamp: 'DF 12/3/2021 19:43:47'!
addLabel: aString

	labels add:aString.
	
	paths add: OrderedCollection new.! !

!DiagramTransition methodsFor: 'accessing' stamp: 'DF 12/13/2020 14:16:52'!
destination
	^destination! !

!DiagramTransition methodsFor: 'accessing' stamp: 'DF 12/13/2020 13:58:00'!
destination: aDiagramSource
	destination _ aDiagramSource ! !

!DiagramTransition methodsFor: 'accessing' stamp: 'DF 12/13/2020 14:31:59'!
key
	^{ origin . destination } asSet! !

!DiagramTransition methodsFor: 'accessing' stamp: 'DF 12/3/2021 19:48:27'!
magnetPositions
	^paths inject:OrderedCollection new into:[:acc :eachPath | acc addAll: (eachPath collect:[:eachMagnet | eachMagnet position ]). acc ]
	
	! !

!DiagramTransition methodsFor: 'accessing' stamp: 'DF 12/13/2020 14:16:54'!
origin
	^origin! !

!DiagramTransition methodsFor: 'accessing' stamp: 'DF 11/15/2021 22:26:54'!
origin: aDiagramState

	origin _ aDiagramState.
	
! !

!DiagramTransition methodsFor: 'accessing' stamp: 'DF 3/7/2023 22:37:16'!
paths
	^paths! !

!DiagramTransition methodsFor: 'shapes' stamp: 'DF 12/15/2023 21:32:44'!
drawOn: aWhiteboard canvas: aCanvas

	| font |
	
	font := FontFamily defaultFamilyPointSize: 9.
	
	1 to: paths size do:[:i | | p a b c n |
	
		p := paths at:i.
		
		a := p at:1 :: position . 	b := p at:2 :: position . c := p at:3 :: position.
		
		aWhiteboard drawOn: aCanvas quadraticBezierStart: a control: b end: c width: 1 color: Color black.
	
		aWhiteboard drawOn: aCanvas arrowHead: 8 at: c  direction: ( c - b ) normalized width: 1 color: Color black. 
		n := (c - a) normal * 0.5.
		
		"aWhiteboard drawOn: aCanvas lineFrom: b to: b + (n * n theta cos abs ) width:1 color: Color red."
		
		aWhiteboard drawOn: aCanvas string: (labels at:i) at: b + (n * n theta cos abs) + (0.1 * (n theta sin)) font: font color: Color black.
	]! !

!StateDiagram methodsFor: 'initialization' stamp: 'DF 12/5/2021 16:48:21'!
initialize

	states _ Set new.
	
	transitions _ Set new.
	
	selfTransitions _ Set new.
	
	transitionIndex _ Dictionary new.
	
	properties _ CascadingProperties new parent: Defaults ; yourself.! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 5/2/2022 17:31:24'!
asMorphExtent: aPoint

	| aKernelMorph |
	
	aKernelMorph _ BoxedMorph new.

	aKernelMorph color: Color white.
	
	aKernelMorph morphExtent: aPoint.
	
	self populate: aKernelMorph.
	
	aKernelMorph scale: aPoint x / aKernelMorph morphExtent x.

	^aKernelMorph
	
! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 5/3/2022 09:24:50'!
defaultDiagramName

	^title ifNil:[properties at:#default_diagram_name] ! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 12/18/2023 22:50:44'!
drawOn: aWhiteboardMorph

	aWhiteboardMorph removeAllShapes. 
		
	selfTransitions do:[:each | aWhiteboardMorph addShape: each ].

	states do:[:each | aWhiteboardMorph addShape: each ].

	transitions do:[:each | aWhiteboardMorph addShape: each ].
	

! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 11/30/2021 21:01:22'!
editProperties

	properties edit! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 12/14/2023 19:43:38'!
open
	KleeneViewer open: self label: (title ifNil:['Kleene State Machine Diagram']).
! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 12/18/2023 19:29:08'!
populate: aWhiteboardMorph

	self layoutDiagram.

	aWhiteboardMorph whiteboard window: self window viewport: ((0@0 extent: aWhiteboardMorph morphExtent) insetBy: 30).
	
	self drawOn: aWhiteboardMorph.
	
	aWhiteboardMorph redrawNeeded.
! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 11/30/2021 21:37:26'!
solve: nIterations

! !

!StateDiagram methodsFor: 'layout' stamp: 'DF 3/7/2023 22:16:12'!
arrange: magnets separatedBy: aNumber

	|explored todo current adj next x |
	
	explored _ Set new.
	
	todo _ OrderedCollection new.
	
	todo add: initialState.
	
	explored add: initialState.
	
	(magnets at: initialState) position: 0.0@0.0.

	x _ aNumber.
		
	[todo isEmpty] whileFalse:[
		
		"invariant: all elements in explored are already positioned".
		
		current _ todo removeFirst	.	

		adj _ transitions select:[:each | each origin = current and:[ (explored includes: each destination) not ] ].
		
		next _ (adj collect:[:each | each destination ]) asOrderedCollection.
		
		(1 to:next size) do:[:i | (magnets at:(next at:i)) position: x @ ((i-1)*aNumber + (0.3 * Random next)) ].
			
		explored addAll: next.
		
		next do:[:each | todo addLast: 	each].

		x _ x + aNumber.
	].
! !

!StateDiagram methodsFor: 'layout' stamp: 'DF 1/31/2021 14:48:20'!
layoutDiagram

	self layoutStates ; layoutTransitions.
	
	
	! !

!StateDiagram methodsFor: 'layout' stamp: 'DF 3/7/2023 22:15:48'!
layoutStates

	| charge range magnets constraints springLength springStrength aSolver |	

	charge _ properties at: #state_charge.
	
	range _ properties at: #state_position_range.

	springLength _ properties at: #state_layout_spring_length.

	springStrength _ properties at: #state_layout_spring_strength.

	magnets _ Dictionary new.
	
	states do:[:each | magnets at: each put: (Magnet charge: charge position: range atRandom @ range atRandom) ].

	self arrange: magnets separatedBy: 2 * springLength.
	
	constraints _ Dictionary new.
	
	transitions 
		do:[:each | 
			constraints at: each key 
				ifAbsent:[constraints at: each key 
					put: (Spring length: springLength  strength: springStrength between: (magnets at: each origin) and: (magnets at: each destination)) ] ].
		
	aSolver _ ForceDirectedSolver 	new.
	
	magnets do:[:each | aSolver addObject: each].
	
	constraints do:[:each | aSolver addConstraint: each].
	
	"aSolver setProperty: #spring_debug to: true."
	
	aSolver solve: (properties at: #state_layout_solver_iterations).
	
	aSolver diverged ifTrue:[self error: 'solver diverged'].
	
	magnets associations do:[:each | each key position: each value position ].
	
	(properties at:#state_layout_show_solution) ifTrue:[
		GaudiViewer open: aSolver].
	
! !

!StateDiagram methodsFor: 'layout' stamp: 'DF 12/15/2023 17:52:55'!
layoutTransitions

	| aSolver | 
	
	aSolver := ForceDirectedSolver 	new.
		
	transitions do:[:each | each layoutIn: aSolver with: properties ].

	selfTransitions do:[:each | each layoutIn: aSolver around: (self magnetsAround: each state) with: properties ].
	
	aSolver solve: (properties at: #transition_layout_solver_iterations).
	
	(properties at: #transition_layout_show_solution) ifTrue:[
		GaudiViewer open: aSolver].
	
! !

!StateDiagram methodsFor: 'layout' stamp: 'DF 3/7/2023 22:45:17'!
magnetsAround: aDiagramState

	| outgoing incoming magnets |
	
	magnets _ OrderedCollection new.
	
	outgoing _ transitions select:[:each | each origin == aDiagramState ].
	
	incoming _ transitions select:[:each | each destination == aDiagramState].
	
	outgoing do:[:each | magnets addAll:(each paths collect:[:p | p first ] ) ].
	
	incoming do:[:each | magnets addAll:(each paths collect:[:p | p last ] ) ].
	
	magnets _ magnets sorted: [:p :q | (p position - aDiagramState position) theta <= (q position - aDiagramState position) theta ].
	
	^magnets! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/5/2021 16:48:21'!
addState: aDiagramState
	states add: aDiagramState.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/4/2021 16:04:30'!
connect: originDiagramState to: destinationrDiagramState label: aString
	
	originDiagramState addNeighbour: destinationrDiagramState.
	
	originDiagramState = destinationrDiagramState 
		ifTrue:[
			selfTransitions add: (DiagramSelfTransition new state: originDiagramState; label: aString; yourself) ]
		ifFalse:[
			| aTransition | 
			
			aTransition _ DiagramTransition new origin: originDiagramState ; destination: destinationrDiagramState ; addLabel: aString; yourself.
			
			transitionIndex at: { aTransition origin . aTransition destination }
				ifPresent:[:current | current addLabel: aString ]
				ifAbsent:[transitionIndex at: { aTransition origin . aTransition destination } put: aTransition. transitions add: aTransition].
				
			].
		
		! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 20:34:25'!
getProperty: aSymbol 
	^properties at: aSymbol ! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 20:38:06'!
getStateCharge

	^self getProperty: #state_charge.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 20:57:05'!
getStateRadius

	^self getProperty: #state_radius.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 20:39:03'!
getTransitionLength

	^self getProperty: #state_layout_spring_length.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 20:40:26'!
getTransitionStrength

	^self getProperty: #state_layout_spring_strength.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/15/2023 22:04:31'!
setInitialState: aDiagramState

	states add: aDiagramState. 
	
	initialState := aDiagramState.
	
	aDiagramState initial: true.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 11/18/2021 10:48:24'!
setProperty: aSymbol to: anObject
	properties at: aSymbol put: anObject! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 20:36:58'!
setStateCharge: aNumber

	self setProperty: #state_charge to: aNumber.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/18/2023 19:30:07'!
setStateRadius: aNumber

	states do:[:each | each radius: aNumber].
	
	^self setProperty: #state_radius to: aNumber.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 20:39:49'!
setTransitionLength: aNumber

	self setProperty: #state_layout_spring_length to: aNumber.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 20:40:36'!
setTransitionStrength: aNumber

	self setProperty: #state_layout_spring_strength to: aNumber.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/15/2023 15:04:29'!
states
	^states! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 5/3/2022 09:20:49'!
title: aString
	title _ aString! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/15/2023 15:08:35'!
transitions
	^transitions! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/14/2023 21:06:20'!
window

	"answers the smallest rectangle that holds all the states and transitions in the system"
	
	| window positions radius |
		
	positions :=  states collect:[:each| each position].
	
	transitions do:[:eachTransition | 
		positions addAll: eachTransition magnetPositions ].
	
	window := Rectangle encompassing: positions.
	
	radius := properties at:#state_radius.
	
	window := window expandBy: (radius @ radius) * 3.
	
	^window supremum! !

!StateDiagram methodsFor: 'testing' stamp: 'DF 12/5/2021 14:25:24'!
hasSelfTransitions

	^selfTransitions notEmpty! !

!StateDiagram methodsFor: 'testing' stamp: 'DF 12/5/2021 16:48:21'!
isConnected

	"answers true iff all states are reachable from the initial state"
	
	| reachable explored todo aState |
				
	explored _ Set new. "all the states whose neighbours were examined".

	reachable _ Set new. "all state that were visited so far"
	
	todo _ OrderedCollection new. "all reachable states whose neighbours still require exploring"

	todo add: initialState.

	reachable add: initialState.
	
	"invariants:
	
		I.1. all states in reachable are reachable from initialState 
		I.2. todo = reachable - explored 
		"		
		
	[todo isEmpty] whileFalse:[
		aState _ todo removeFirst.
		reachable addAll: aState adj.
		explored add: aState.
		todo addAll: (aState adj reject:[:each | explored includes: each ]).
	].

	^ reachable = states 
		
	
	
	! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 16:55:02'!
example

	"self example"
	
	| r a b c aStateDiagram |

	aStateDiagram := self new.
	
	r := 0.5.
	
	aStateDiagram setProperty: #state_radius to:r.

	aStateDiagram setProperty: #state_layout_spring_length to: 6.

	a := DiagramState new radius:r ; label:'a'; yourself.
	
	b := DiagramState new radius:r ; label:'b' ; yourself.
	
	c := DiagramState new radius:r ; label:'c';  accepting: true; yourself.
		
	aStateDiagram addState: a; addState:b ; addState:c.

	aStateDiagram setInitialState: a.
		
	aStateDiagram connect: a to: b 	label: 'open'.
	aStateDiagram connect: b to: a 	label: 'swap'.
	aStateDiagram connect: a to: a 	label: 'self'.
	aStateDiagram connect: b to: c 	label: 'done'.
	aStateDiagram connect: b to: c 	label: 'close'.
	aStateDiagram connect: a to: c 	label: 'insert'.
	
"
	
	aStateDiagram setProperty: #transition_layout_solver_iterations to:30.

	aStateDiagram setProperty: #state_charge to:1.5.

	aStateDiagram setProperty: #state_layout_spring_strength to: 0.75.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 3.
	
	aStateDiagram setProperty: #transition_label_relative_position to: 0.3.
	
	aStateDiagram setProperty: #debug_labels to:true.
"	
	aStateDiagram open.
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 22:18:40'!
example2
 
	"self example2" 
	
	| r abc ab bc ac a b c empty aStateDiagram |
		
	aStateDiagram := self new.

	r := 0.5.

	aStateDiagram setProperty: #state_radius to: r.
	
	a := DiagramState new radius:r ; label:'{a}'; yourself.
	
	b := DiagramState new radius:r ; label:'{b}' ; yourself.
	
	c := DiagramState new radius:r ; label:'{c}';  yourself.

	ab := DiagramState new radius:r ; label:'{a,b}'; yourself.
	
	bc := DiagramState new radius:r ; label:'{b,c}' ; yourself.
	
	ac := DiagramState new radius:r ; label:'{a,c}';  yourself.

	abc := DiagramState new radius:r ; label:'{a,b,c}';  yourself.
	
	empty := DiagramState new radius:r ; label:'{}'; yourself.

	aStateDiagram setProperty: #transition_layout_solver_iterations to:30.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.
	
	aStateDiagram setProperty: #debug_labels to:true.
	
	aStateDiagram addState:empty; addState: a; addState:b ; addState:c; addState: ab; addState: bc; addState:ac; addState:abc.
	
	aStateDiagram setInitialState: empty.
	
	aStateDiagram connect: empty to: a 	label: 'a'.
	aStateDiagram connect: empty to: b 	label: 'b'.
	aStateDiagram connect: empty to: c 	label: 'c'.

	aStateDiagram connect: a to: a 	label: 'a'.

	aStateDiagram connect: a to: ab 	label: 'b'.
	aStateDiagram connect: a to: ac 	label: 'c'.

	aStateDiagram connect: b to: b 	label: 'b'.

	aStateDiagram connect: b to: ab 	label: 'a'.
	aStateDiagram connect: b to: bc 	label: 'c'.

	aStateDiagram connect: c to: c 	label: 'c'.

	aStateDiagram connect: c to: ac 	label: 'a'.
	aStateDiagram connect: c to: bc 	label: 'b'.

	aStateDiagram connect: ab to: ab 	label: 'a,b'.

	aStateDiagram connect: ab to: abc 	label: 'c'.	
	aStateDiagram connect: bc to: abc 	label: 'a'.
	aStateDiagram connect: ac to: abc 	label: 'b'.

	aStateDiagram connect: abc to: abc 	label: 'a,b,c'.
	
	aStateDiagram open.
	
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 18:32:53'!
example3

	"self example3"
	
	| r a b c d aStateDiagram |
		
	aStateDiagram := self new.

	r := 0.5.

	aStateDiagram setProperty: #state_radius to: r.
	
	a := DiagramState new radius:r ; label:'a'; yourself.
	
	b := DiagramState new radius:r ; label:'b' ; yourself.
	
	c := DiagramState new radius:r ;label:'c';  yourself.

	d := DiagramState new radius:r ;label:'d';  yourself.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.
		
	aStateDiagram setInitialState: a.
	
	aStateDiagram addState: a; addState:b ; addState:c; addState: d.
	
	aStateDiagram connect: a to: b 	label: 'ab'.
	aStateDiagram connect: b to: c 	label: 'bc'.
	aStateDiagram connect: c 	to: d label: 'cd'.
	aStateDiagram connect: a to: d 	label: 'ad'.
	aStateDiagram connect: a to: c 	label: 'ac'.
	aStateDiagram connect: c to: a 	label: 'ca'.
	
	aStateDiagram open.
	
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 18:33:50'!
example4

	"self example4"
	
	| r states aStateDiagram |
	
	aStateDiagram := self new.

	r := 0.5.

	aStateDiagram setProperty: #state_radius to: r.

	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.
		
	states := (1 to: 11) collect:[ :each | DiagramState new radius:r ; label: each asString; yourself].

	aStateDiagram setInitialState: (states at:1).
	(states at:3) accepting: true.
	
	states do:[:each | aStateDiagram addState: each ].
	
	aStateDiagram connect: (states at:1) to: (states at:8) 	label: 'write point'.

	aStateDiagram connect: (states at:8) to: (states at:11) 	label: 'skip'.

	aStateDiagram connect: (states at:11) to: (states at:10) 	label: 'move left'.
	
	aStateDiagram connect: (states at:10) to: (states at:6) 	label: 'skip'.

	aStateDiagram connect: (states at:6) to: (states at:7) 	label: 'one/0/one'.

	aStateDiagram connect: (states at:6) to: (states at:9) 	label: 'blank/0/blank'.
	aStateDiagram connect: (states at:6) to: (states at:9) 	label: 'zero/0/zero'.
	aStateDiagram connect: (states at:6) to: (states at:9) 	label: 'point/0/point'.

	aStateDiagram connect: (states at:7) to: (states at:11) 	label: 'write zero'.

	aStateDiagram connect: (states at:9) to: (states at:5) 	label: 'skip'.

	aStateDiagram connect: (states at:5) to: (states at:4) 	label: 'move right'.

	aStateDiagram connect: (states at:4) to: (states at:2) 	label: 'zero/0/zero'.

	aStateDiagram connect: (states at:2) to: (states at:5) 	label: 'skip'.

	aStateDiagram connect: (states at:4) to: (states at:3) 	label: 'one/0/one'.
	aStateDiagram connect: (states at:4) to: (states at:3) 	label: 'point/0/point'.
	aStateDiagram connect: (states at:4) to: (states at:3) 	label: 'blank/0/blank'.
	
	aStateDiagram open.
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 20:44:46'!
example5

	"self example5"
	
	| r states aStateDiagram |
	
	aStateDiagram := self new.

	r := 0.5.

	aStateDiagram setProperty: #state_radius to: r.
	
	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.

	aStateDiagram setProperty: #state_morph_font to: (FontFamily defaultFamilyPointSize:9).
	aStateDiagram setProperty: #transition_label_font to: (FontFamily defaultFamilyPointSize:9).

		
	states := (1 to: 11) collect:[ :each | DiagramState new label: each asString; radius:r; yourself].

	(states at:3) accepting: true.
	
	states do:[:each | aStateDiagram addState: each ].

	aStateDiagram setInitialState: (states at:1).
		
	aStateDiagram connect: (states at:1) to: (states at:8) 	label: 'write point'.

	aStateDiagram connect: (states at:8) to: (states at:11) 	label: 'skip'.

	aStateDiagram connect: (states at:11) to: (states at:10) 	label: 'move left'.
	
	aStateDiagram connect: (states at:10) to: (states at:6) 	label: 'skip'.

	aStateDiagram connect: (states at:6) to: (states at:7) 	label: 'one/0/one'.

	aStateDiagram connect: (states at:6) to: (states at:9) 	label: 'blank/0/blank'.
	aStateDiagram connect: (states at:6) to: (states at:9) 	label: 'zero/0/zero'.
	aStateDiagram connect: (states at:6) to: (states at:9) 	label: 'point/0/point'.

	aStateDiagram connect: (states at:7) to: (states at:11) 	label: 'write zero'.

	aStateDiagram connect: (states at:9) to: (states at:5) 	label: 'skip'.

	aStateDiagram connect: (states at:5) to: (states at:4) 	label: 'move right'.

	aStateDiagram connect: (states at:4) to: (states at:2) 	label: 'zero/0/zero'.

	aStateDiagram connect: (states at:2) to: (states at:5) 	label: 'skip'.

	aStateDiagram connect: (states at:4) to: (states at:3) 	label: 'one/0/one'.
	
	aStateDiagram connect: (states at:4) to: (states at:3) 	label: 'point/0/point'.
	aStateDiagram connect: (states at:4) to: (states at:3) 	label: 'blank/0/blank'.

	aStateDiagram open.
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 22:21:22'!
example6

	"self example6"
	
	| r states aStateDiagram |
	
	aStateDiagram := self new.

	r := 0.5.

	aStateDiagram setProperty: #state_radius to: r.

	states := (1 to: 2) collect:[ :each | DiagramState new label: each asString; radius:r ; yourself].

	states do:[:each | aStateDiagram addState: each ].

	aStateDiagram setInitialState: (states at:1).
		
	aStateDiagram connect: (states at:1) to: (states at:2) 	label: 'a'.
	aStateDiagram connect: (states at:1) to: (states at:2) 	label: 'b'.
	aStateDiagram connect: (states at:1) to: (states at:2) 	label: 'c'.
	
	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.
	
	aStateDiagram open.
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 22:22:42'!
example7

	"self example7"
	
	| r a b c aStateDiagram |

	aStateDiagram := self new.

	r := 0.5.

	aStateDiagram setProperty: #state_radius to: r.
	
	a := DiagramState new label:'a'; radius: r; yourself.
	
	b := DiagramState new label:'b' ; radius: r; yourself.
	
	c := DiagramState new label:'c';  radius: r; accepting: true; yourself.

	aStateDiagram addState: a; addState:b ; addState:c.

	aStateDiagram setInitialState: a.
		
	aStateDiagram connect: a to: b 	label: 'open'.
	aStateDiagram connect: b to: a 	label: 'swap'.
	aStateDiagram connect: a to: a 	label: 'self'.
	aStateDiagram connect: b to: c 	label: 'done'.
	aStateDiagram connect: b to: c 	label: 'close'.
	aStateDiagram connect: a to: c 	label: 'insert'.
	
	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.
	
	aStateDiagram open.
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 22:26:12'!
example8

	"self example8"
	
	| aStateDiagram |
	
	aStateDiagram := self radius: 0.5 initial: 1 states: { 1 . 2 . 3 . 4 } transitions: { { 1 . 'b' . 1 } . { 1 . 'a' . 2 } . { 2 . 'b' . 2 } . { 2 . 'a' . 3 } . { 3 . 'a' . 3 } . { 3 . 'b' . 4 } . { 4 . 'a' . 1 } . { 4 . 'b' . 4 } } accepting: { 3 . 4 }.
	
	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to:5.
	
	aStateDiagram title: 'sm1' ; open.
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 12/15/2023 22:27:42'!
example9

	"self example9"
	
	| aStateDiagram |
	
	aStateDiagram := self radius: 0.5 initial: 1 states: { 1 . 2 . 3 . 4 } transitions: { { 1 . 'b' . 1 } . { 1 . 'a' . 2 } . {1 . 'c' .  3} . { 2 . 'a' . 3 }  . { 3 . 'b' . 4 } . { 4 . 'a' . 1 } } accepting: { 3 . 4 }.
	
	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to:10.
	
	aStateDiagram title: 'sm1' ; open.

! !

!StateDiagram class methodsFor: 'class initialization' stamp: 'DF 12/14/2023 20:54:05'!
initialize

	"self initialize"
	
	Defaults := CascadingProperties new
		  at: #state_diagram_inset put: 64
		; at: #transition_line_width put:			1
		; at: #state_position_range put: 800
		; at: #state_radius put: 1
		; at: #state_charge put: 1
		; at: #state_layout_spring_length put: 10
		; at: #state_layout_spring_strength put:0.75
		; at: #state_layout_solver_iterations put: 100
		; at: #state_layout_show_solution put: false
		; at: #transition_morph_color  put: Color gray
		; at: #transition_morph_width put: 1
		; at: #transition_morph_arrow_length put: 8
		; at: #transition_label_font put: FontFamily defaultFamilyAndPointSize
		; at: #transition_label_relative_position put: 0.333
		; at: #transition_label_distance put: 20
		; at: #transition_layout_solver_iterations put: 100
		; at: #transition_layout_show_solution put: false
		; at: #transition_origin_magnet_charge put: 0.125
		; at: #transition_midpoint_magnet_charge put: 1
		; at: #transition_destination_magnet_charge put: 0.125
		; at: #transition_destination_separation_angle put: -18
		; at: #transition_origin_separation_angle put: 18
		; at: #transition_anchor_spring_strength put: 15
		; at: #transition_mid_spring_strength put: 0.35
		; at: #transition_mid_spring_length_factor put: 0.3
		; at: #self_transition_magnet_charge put: 0.2
		; at: #self_transition_spring_length_factor put: 0.8
		; at: #self_transition_spring_strength put: 5
		; at: #state_morph_color put: Color lightYellow
		; at: #initial_state_morph_color put: Color lightGreen
		; at: #state_border_width put: 2
		; at: #state_border_color put: Color veryLightGray
		; at: #state_morph_font put: FontFamily defaultFamilyAndPointSize
		; at: #state_morph_label_color put: Color black
		; at: #debug_labels put: false
		; at: #debug_self_transition_labels put: false
		; at: #default_diagram_name put:'kleene'.
		
		
		
		! !

!StateDiagram class methodsFor: 'instance creation' stamp: 'DF 12/15/2023 22:24:18'!
radius: aNumber initial: anObject states: aSet transitions: aRelation

	| aStateDiagram map |
		
	aStateDiagram := self new.
	
	aStateDiagram setProperty:#state_radius to: aNumber.
	
	map := Dictionary new.
			
	aSet do:[:each | map at: each put: (DiagramState new label: each asString; radius: aNumber; yourself) ].	

	aStateDiagram setInitialState: (map at:anObject).
	
	aSet do:[:each | aStateDiagram addState: (map at: each) ].
	
	aRelation do:[:each | aStateDiagram connect: (map at: each key) to: (map at: each value) label: ''].
	
	^aStateDiagram! !

!StateDiagram class methodsFor: 'instance creation' stamp: 'DF 12/15/2023 22:24:26'!
radius: aNumber initial: anObject states: states transitions: tuples accepting: acceptingStates

	| aStateDiagram map |
		
	aStateDiagram := self new.

	aStateDiagram setProperty:#state_radius to: aNumber.
	
	map := Dictionary new.
			
	states do:[:each | map at: each put: (DiagramState new label: each asString; radius: aNumber; yourself) ].	

	acceptingStates do:[:each | (map at: each) accepting: true].
	
	aStateDiagram setInitialState: (map at:anObject).
	
	states do:[:each | aStateDiagram addState: (map at: each) ].
	
	tuples do:[:each | aStateDiagram connect: (map at: each first) to: (map at: each third) label: each second ].
	
	^aStateDiagram! !

!StateDiagram class methodsFor: 'morphic' stamp: 'DF 12/8/2021 20:10:25'!
gallery

	"self gallery"
	
	| nRows nCols diagrams aColumnMorph aScrollPane aWindow |
	
	diagrams _ (StateDiagram enumerate:3) asOrderedCollection.

	nRows _ 4. nCols _ 8.
	
	aColumnMorph _ LayoutMorph newColumn.
	
	(1 to: nRows) do:[:row |  | aRowMorph | 
		aRowMorph _ LayoutMorph newRow.
		(1 to: nCols) do:[:col | 
			aRowMorph addMorph: ((diagrams at: (row-1) * nCols + col ) asMorphExtent: 210@210).
			].
		aColumnMorph addMorph: aRowMorph ].
	
	aScrollPane _ PluggableScrollPane new.
		
	aWindow _ aScrollPane embeddedInMorphicWindowLabeled: 'Gallery #3'.	
	
	aWindow openInWorld.

	aScrollPane scroller: aColumnMorph.
! !

!StateDiagram class methodsFor: 'enumerating' stamp: 'DF 12/5/2021 16:49:28'!
enumerate: anInteger

	| pairs subsets diagrams states |
		
	states _ (1 to: anInteger) collect:[:each | each].
	
	pairs _ (states collect:[:first | states collect:[:second | first -> second ] ] ) flatten.
	
	subsets _ pairs asSet subsets.
		
	diagrams _ subsets collect:[:each | StateDiagram radius:1 initial: 1 states: states transitions: each ].
	
	^(diagrams select:[:each | each isConnected]) reject:[:each | each hasSelfTransitions]
	

	
	! !

!Whiteboard methodsFor: 'drawing' stamp: 'DF 12/15/2023 16:17:47'!
drawOn: aCanvas arrowHead: length at: aPoint direction: aDirection width: aNumber color: aColor

	| p q |

	p := ​ transform transform: aPoint.
	q := ​ p - (Point r: length degrees: (aDirection degrees - 30)).
	
	aCanvas
		line: p
		to: q
		width: aNumber
		color: aColor.

	q := p - (Point r: length degrees: (aDirection degrees + 30)).
				
	aCanvas
		line: p
		to: q
		width: aNumber
		color: aColor.
	! !

!Whiteboard methodsFor: 'drawing' stamp: 'DF 12/15/2023 14:08:27'!
drawOn: aCanvas circleCenter: aPoint radius: aNumber borderWidth: bwidth borderColor: bcolor fillColor: fcolor

	| p r |
	
	r := aNumber * (transform a11 @ transform a22).
	
	p := transform transform: aPoint.
		
	aCanvas ellipseCenter: p radius: r borderWidth: bwidth borderColor: bcolor fillColor: fcolor.! !

!Whiteboard methodsFor: 'drawing' stamp: 'DF 12/15/2023 21:13:53'!
drawOn: aCanvas lineFrom: startPoint to: endPoint width: aNumber color: aColor

	| s e |
	
	s := transform transform: startPoint.
	e := transform transform: endPoint.
	
	aCanvas strokeWidth: aNumber color: aColor do: [
		aCanvas 
			moveTo: s;
			lineTo: e
	]! !

!Whiteboard methodsFor: 'drawing' stamp: 'DF 12/15/2023 14:56:04'!
drawOn: aCanvas quadraticBezierStart: startPoint control: controlPoint end: endPoint width: aNumber color: aColor
	
	| s c e |
	
	s := transform transform: startPoint.
	c := transform transform: controlPoint.
	e := transform transform: endPoint.
	
	aCanvas strokeWidth: aNumber color: aColor do: [
		aCanvas 
			moveTo: s;
			quadraticBezierTo: e control: c 
	]! !

!Whiteboard methodsFor: 'drawing' stamp: 'DF 12/15/2023 20:55:28'!
drawOn: aCanvas string: aString at: aPoint font: aFont color: aColor 	

	| p e b f |
	
	p := transform transform: aPoint.

	e := ((aFont widthOfString: aString) max: 3)  @ aFont lineSpacing.
	
	b := p extent: e. 
	
	f := b aligned: b center with: p.
	
	"aCanvas frameRectangle: (f) borderWidth: 1 color: Color red."
	
	aCanvas drawString: aString at: f origin font: aFont color: aColor.! !

!Whiteboard methodsFor: 'as yet unclassified' stamp: 'DF 12/18/2023 19:45:49'!
viewport: anotherRectangle
	
	viewport := anotherRectangle.
	
	transform := AffineTransformation transformFrom: window to: viewport ! !

!Whiteboard methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 13:47:04'!
window: aRectangle viewport: anotherRectangle
	
	window := aRectangle.
	viewport := anotherRectangle.
	
	transform := AffineTransformation transformFrom: window to: viewport ! !

!Whiteboard methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 17:15:41'!
zoomIn

	self window: (window expandBy: (-0.1 * window extent)) viewport: viewport.! !

!Whiteboard methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2023 17:15:32'!
zoomOut

	self window: (window expandBy: (0.1 * window extent)) viewport: viewport.! !

!Set methodsFor: '*Kleene' stamp: 'DF 12/4/2021 21:50:52'!
subsets

	^self isEmpty
		ifTrue:[ { Set new } asSet ]
		ifFalse:[ | anObject rs ss | 
			anObject _ self anyOne.
			rs _ (self copyWithout: anObject) subsets.
			ss _ Set new. 
			ss addAll: rs.
			ss addAll: (rs collect:[:each | each copy add: anObject ; yourself  ]).
			ss ]! !
StateDiagram initialize!
