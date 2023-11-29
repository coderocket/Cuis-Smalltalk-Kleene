'From Cuis 6.0 [latest update: #6053] on 29 November 2023 at 7:40:55 pm'!
'Description '!
!provides: 'Kleene' 1 2!
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

!classDefinition: #StateDiagramTest category: #Kleene!
TestCase subclass: #StateDiagramTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'StateDiagramTest class' category: #Kleene!
StateDiagramTest class
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
	instanceVariableNames: 'adj position radius accepting initial label'
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

!StateDiagramTest methodsFor: 'as yet unclassified' stamp: 'DF 3/6/2023 20:15:50'!
testIsConnected

	| a b c aStateDiagram |
	
	a _ DiagramState new radius:1 ; label:'a'; yourself.
	
	b _ DiagramState new radius:1 ; label:'b' ; yourself.
	
	c _ DiagramState new radius:1 ; label:'c';  accepting: true; yourself.

	aStateDiagram _ StateDiagram new.

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

!StateDiagramTest methodsFor: 'as yet unclassified' stamp: 'DF 3/6/2023 20:15:54'!
testNotConnected

	| a b c aStateDiagram |
	
	a _ DiagramState new radius:1 ; label:'a'; yourself.
	
	b _ DiagramState new radius:1 ; label:'b' ; yourself.
	
	c _ DiagramState new radius:1 ; label:'c';  accepting: true; yourself.

	aStateDiagram _ StateDiagram new.
		
	aStateDiagram addState: a; addState:b ; addState:c.

	aStateDiagram setInitialState: a.
		
	aStateDiagram connect: a to: b 	label: 'open'.
	aStateDiagram connect: b to: a 	label: 'swap'.
	aStateDiagram connect: a to: a 	label: 'self'.
	aStateDiagram connect: c to: b 	label: 'done'.

	self assert: aStateDiagram isConnected equals: false
	! !

!DiagramSelfTransition methodsFor: 'accessing' stamp: 'DF 12/15/2020 18:49:08'!
label: aString
	label _ aString! !

!DiagramSelfTransition methodsFor: 'accessing' stamp: 'DF 3/7/2023 23:00:50'!
state
	^state! !

!DiagramSelfTransition methodsFor: 'accessing' stamp: 'DF 12/15/2020 18:49:02'!
state: aDiagramState
	state _ aDiagramState! !

!DiagramSelfTransition methodsFor: 'morphic' stamp: 'DF 5/3/2022 09:13:48'!
asMorph: aTransform with: properties 

	| alpha anArcMorph extent anArrowMorph origin aLabelMorph |
	
	alpha _ (magnet position - state position) degrees.
		
	extent _ aTransform scale * 2 * (state radius @ state radius).
	
	anArcMorph _ ArcMorph new angle:270 ; direction: alpha + 45; morphExtent: extent; lineWidth:(properties at: #transition_morph_width); color: (properties at:#transition_morph_color); yourself.
	
	origin _ (anArcMorph start + anArcMorph end) / 2.
	
	anArcMorph morphPosition: 	(aTransform transform: magnet position) - origin.

	anArrowMorph _ SimpleLineMorph new lineWidth:(properties at: #transition_morph_width) ; color: (properties at:#transition_morph_color); startPoint: anArcMorph end; endPoint: (Point r:1 degrees: alpha+ 60 + 180) ; arrow: true; arrowHeadLength: (properties at: #transition_morph_arrow_length); yourself.
	
	anArcMorph addMorph: anArrowMorph.
	
	aLabelMorph _ LabelMorph new contents: label ; yourself.
	
	aLabelMorph font: (properties at: #transition_label_font).
	
	aLabelMorph  morphPosition: (Point r: extent x degrees: alpha) + origin.
	
	anArcMorph addMorph: aLabelMorph.
	
	(properties at:#debug_self_transition_labels) ifTrue:[
		anArcMorph addMorph: (SimpleLineMorph new lineWidth:1 ; color: Color red; startPoint: origin; endPoint: (Point r: extent x degrees: alpha); arrow: true; yourself)].
	
	^anArcMorph ! !

!DiagramSelfTransition methodsFor: 'morphic' stamp: 'DF 3/7/2023 23:40:02'!
layoutIn: aForceSolver around: magnets with: properties 

	| anchor spring index maxa maxi a p |

	index _ 1.

	maxa _ 0.
	maxi _ 1.
			
	[index < magnets size] 
		whileTrue:[	
			a _ ((magnets at:index + 1) position theta - (magnets at:index) position theta) abs.
			maxa < a ifTrue:[
				maxi _ index. maxa _ a].
			index _ index + 1 ].
	
	a _ 	((magnets at: 1) position theta - (magnets at:index) position theta) abs.
	maxa < a ifTrue:[
		maxi _ index. maxa _ a].
	
	p _ Point rho: state radius theta: (magnets at:maxi) position theta + (maxa / 2).
	
	anchor _ Anchor new position: state position; yourself.
	
	magnet _ Magnet new charge: (properties at:#self_transition_magnet_charge); position: state position + (p) ; yourself.

	spring _ Spring length: (properties at:#self_transition_spring_length_factor) * state radius strength: (properties at:#self_transition_spring_strength) between: anchor and: magnet.
	
	aForceSolver addObject: anchor; addObject: magnet; addConstraint: spring.
! !

!DiagramSelfTransition methodsFor: 'morphic' stamp: 'DF 3/7/2023 22:29:44'!
layoutIn: aForceSolver with: properties 

	| anchor spring |
	
	anchor _ Anchor new position: state position; yourself.
	
	magnet _ Magnet new charge: (properties at:#self_transition_magnet_charge); position: state position + (state radius @ 0) ; yourself.

	spring _ Spring length: (properties at:#self_transition_spring_length_factor) * state radius strength: (properties at:#self_transition_spring_strength) between: anchor and: magnet.
	
	aForceSolver addObject: anchor; addObject: magnet; addConstraint: spring.
! !

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

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/13/2020 14:07:15'!
radius
	^radius! !

!DiagramState methodsFor: 'accessing' stamp: 'DF 12/13/2020 14:06:49'!
radius: aNumber
	radius _ aNumber! !

!DiagramState methodsFor: 'morphic' stamp: 'DF 11/29/2023 19:02:05'!
asMorph: aTransform with: properties 

	| aStateMorph color scale |

	"scale := (aTransform transform: 0@0) corner: (aTransform transform: (radius * 2) @ (radius * 2))."
	
	scale := aTransform scale * 2 * radius.

	aStateMorph := StateMorph new.
	
	"aStateMorph morphExtent: scale * ((radius * 2) @ (radius * 2)) ; morphPosition: (aTransform transform:position - (radius @ radius))."

	aStateMorph morphExtent: scale @ scale ; morphPosition: (aTransform transform: position - (radius@radius)).
	
	color := initial ifTrue:[ properties at:#initial_state_morph_color ] ifFalse:[ properties at:#state_morph_color].
	
	aStateMorph color: color; borderWidth: (properties at:#state_border_width); borderColor: (properties at:#state_border_color).
	
	aStateMorph label: label ; accepting: accepting.
	
	aStateMorph font: (properties at:#state_morph_font); textColor: (properties at:#state_morph_label_color).
	
	^aStateMorph.
	
! !

!DiagramState methodsFor: 'initialization' stamp: 'DF 12/4/2021 16:00:59'!
initialize

	adj _ Set new.
	accepting _ false.
	initial _ false.
	
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

!DiagramTransition methodsFor: 'morphic' stamp: 'DF 11/29/2023 18:36:53'!
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
		aLineMorph := SimpleLineMorph new startPoint: (mpath at:2) + (((mpath at:3) - (mpath at:2)) * (properties at:#transition_label_relative_position)) - rect origin ; endPoint: (direction normal * length) - rect origin; lineWidth: 0.5;yourself.
	
		aLineMorph color: Color red.
	
		aMorph addMorph: aLineMorph.
	].
	
	^aMorph! !

!DiagramTransition methodsFor: 'layout' stamp: 'DF 12/3/2021 19:49:57'!
layoutIn: aForceSolver with: properties 

	(1 to: paths size) do:[:index |	
		self layoutPathAt: index In: aForceSolver with: properties].
! !

!DiagramTransition methodsFor: 'layout' stamp: 'DF 12/5/2021 17:43:17'!
layoutPathAt: index In: aForceSolver with: properties 
	
	| aPath destinationAnchor originAnchor originMagnet midMagnet destinationMagnet direction distance offset alpha beta centralOffset |
	
	offset _ index - ((paths size + 1) / 2).	

	aPath _ paths at:index.
	
	aPath removeAll.
	
	direction _ destination position - origin position.

	distance _ direction r.
	
	direction _ direction normalized.
		
	"we create an anchor for the origin and destination positions"
	
	originAnchor _ Anchor position: origin position.

	aForceSolver addObject: originAnchor.
	
	destinationAnchor _ Anchor position: destination position.

	aForceSolver addObject: destinationAnchor.

	" each anchor is connected to a stick (a very strong spring) with a radius that is equal to the radius of the origin/destination"

	alpha _ (offset = 0) ifTrue:[ 3 ] ifFalse: [(properties at:#transition_origin_separation_angle) * offset ].
	
	originMagnet _ Magnet 	charge: (properties at: #transition_origin_magnet_charge) position: origin position + ((direction * origin radius) rotatedBy: alpha degreesToRadians).

	aPath add: originMagnet.
		
	aForceSolver addObject: originMagnet.
	
	aForceSolver addConstraint: (Spring length: origin radius strength:(properties at: #transition_anchor_spring_strength) between:originAnchor and: originMagnet).

	centralOffset _ (offset = 0) ifTrue:[ 0.125 ] ifFalse:[0].

	midMagnet _ Magnet 	charge: (properties at:#transition_midpoint_magnet_charge) position: origin position + (direction * distance / 2) + (direction normal * (offset + centralOffset) ).

	aForceSolver addObject: midMagnet.

	aPath add: midMagnet.

	"self buildLabelIn: aForceSolver attachedTo: midMagnet."

	beta _ (offset = 0) ifTrue:[ -3 ] ifFalse: [(properties at:#transition_destination_separation_angle) * offset ].
	
	destinationMagnet _ Magnet 	charge:(properties at:#transition_destination_magnet_charge) position: destination position - ((direction * origin radius) rotatedBy: beta degreesToRadians). .

	aForceSolver addObject: destinationMagnet.

	aPath add: destinationMagnet.
	
	aForceSolver addConstraint: (Spring length: destination radius strength:(properties at:#transition_anchor_spring_strength) between:destinationMagnet and: destinationAnchor).

	aForceSolver addConstraint: (Spring length: distance * (properties at:#transition_mid_spring_length_factor) strength: (properties at:#transition_mid_spring_strength) between: originMagnet and: midMagnet).

	aForceSolver addConstraint: (Spring length: distance * (properties at:#transition_mid_spring_length_factor) strength: (properties at:#transition_mid_spring_strength) between: midMagnet and: destinationMagnet).
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

!StateDiagram methodsFor: 'morphic' stamp: 'DF 11/30/2021 21:01:22'!
editProperties

	properties edit! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 5/3/2022 09:22:25'!
open
	GaudiViewer open: self label: (title ifNil:['Kleene State Machine Diagram']).
! !

!StateDiagram methodsFor: 'morphic' stamp: 'DF 11/29/2023 19:37:31'!
populate: aMorph

	| transform line rect p1 p2 p3 |
	
	self layoutDiagram.
		
	transform := AffineTransformation transformFrom: self window to: aMorph morphLocalBounds.
	
	transitions do:[:each | aMorph addAllMorphs: (each asMorph: transform with: properties) ].

	selfTransitions do:[:each | aMorph addMorph: (each asMorph: transform with: properties) ].
	 
	states do:[:each | aMorph addMorph: (each asMorph: transform with: properties) ].

	"mark the initial state."

	p3 := (transform transform: initialState position - (initialState radius@0)).

	p1 := p3 - (Point r:30 degrees: 30).
	
	p2 :=  (p1 + p3) / 2.0.
	
	rect := Rectangle encompassing: {p1 . p2 . p3 }.
	
	line := QuadraticBezier new. 

	line morphPosition: rect origin ; morphExtent: rect extent.
		
	line color: (properties at: #transition_morph_color); curveWidth: (properties at: #transition_morph_width); arrow:  true.
	
	line start: 0@0 ; control: p2 - p1; end: p3 - p1.
		
	aMorph addMorph: line.

	^aMorph ! !

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

!StateDiagram methodsFor: 'layout' stamp: 'DF 3/7/2023 23:01:23'!
layoutTransitions

	| aSolver | 
	
	aSolver _ ForceDirectedSolver 	new.
		
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

!StateDiagram methodsFor: 'accessing' stamp: 'DF 12/5/2021 16:48:21'!
setInitialState: aDiagramState

	states add: aDiagramState. initialState _ aDiagramState.! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 11/18/2021 10:48:24'!
setProperty: aSymbol to: anObject
	properties at: aSymbol put: anObject! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 5/3/2022 09:20:49'!
title: aString
	title _ aString! !

!StateDiagram methodsFor: 'accessing' stamp: 'DF 11/29/2023 19:10:48'!
window

	"answers the smallest rectangle that holds all the states and transitions in the system"
	
	| window positions radius |
		
	positions :=  states collect:[:each| each position].
	
	transitions do:[:eachTransition | 
		positions addAll: eachTransition magnetPositions ].
	
	window := Rectangle encompassing: positions.
	
	radius := (states collect:[:each | each radius]) max.
	
	window := window expandBy: (radius @ radius) * 1.5.
	
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

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/6/2023 22:05:19'!
example

	"self example"
	
	| a b c aStateDiagram |
	
	a _ DiagramState new radius:1 ; label:'a'; yourself.
	
	b _ DiagramState new radius:1 ; label:'b' ; yourself.
	
	c _ DiagramState new radius:1 ; label:'c';  accepting: true; yourself.

	aStateDiagram _ self new.
		
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
	
	aStateDiagram setProperty: #transition_label_relative_position to: 0.3.
	
	aStateDiagram setProperty: #debug_labels to:true.
	
	aStateDiagram open.
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/7/2023 22:27:37'!
example2
 
	"self example2" 
	
	| abc ab bc ac a b c empty aStateDiagram |
	
	a _ DiagramState new radius:1 ; label:'{a}'; yourself.
	
	b _ DiagramState new radius:1; label:'{b}' ; yourself.
	
	c _ DiagramState new radius:1 ; label:'{c}';  yourself.

	ab _ DiagramState new radius:1 ; label:'{a,b}'; yourself.
	
	bc _ DiagramState new radius:1 ; label:'{b,c}' ; yourself.
	
	ac _ DiagramState new radius:1 ; label:'{a,c}';  yourself.

	abc _ DiagramState new radius:1 ; label:'{a,b,c}';  yourself.
	
	empty _ DiagramState new radius:1; label:'{}'; yourself.

	aStateDiagram _ self new.

	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.
	
	aStateDiagram setProperty: #debug_labels to:true.
	
	aStateDiagram addState:empty; addState: a; addState:b ; addState:c; addState: ab; addState: bc; addState:ac; addState:abc.
	
	aStateDiagram setInitialState: a.
	
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

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/6/2023 20:16:12'!
example3

	"self example3"
	
	| a b c d aStateDiagram |
	
	a _ DiagramState new radius:1 ; label:'a'; yourself.
	
	b _ DiagramState new radius:1 ; label:'b' ; yourself.
	
	c _ DiagramState new radius:1 ; label:'c';  yourself.

	d _ DiagramState new radius:1 ; label:'d';  yourself.

	aStateDiagram _ self new.

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

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/6/2023 20:16:17'!
example4

	"self example4"
	
	| states aStateDiagram |
	
	aStateDiagram _ self new.

	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.
		
	states _ (1 to: 11) collect:[ :each | DiagramState new radius:1 ; label: each asString; yourself].

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

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/6/2023 20:16:23'!
example5

	"self example5"
	
	| states aStateDiagram |
	
	aStateDiagram _ self new.

	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to: 10.

	aStateDiagram setProperty: #state_morph_font to: (FontFamily defaultFamilyPointSize:9).
	aStateDiagram setProperty: #transition_label_font to: (FontFamily defaultFamilyPointSize:9).

		
	states _ (1 to: 11) collect:[ :each | DiagramState new radius:0.75 ; label: each asString; yourself].

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

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/6/2023 20:16:27'!
example6

	"self example6"
	
	| states aStateDiagram |
	
	aStateDiagram _ self new.

	states _ (1 to: 2) collect:[ :each | DiagramState new radius:1 ; label: each asString; yourself].

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

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/6/2023 20:16:32'!
example7

	"self example7"
	
	| a b c aStateDiagram |
	
	a _ DiagramState new radius:1 ; label:'a'; yourself.
	
	b _ DiagramState new radius:1 ; label:'b' ; yourself.
	
	c _ DiagramState new radius:1 ; label:'c';  accepting: true; yourself.

	aStateDiagram _ self new.
		
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

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/7/2023 22:15:28'!
example8

	"self example8"
	
	| aStateDiagram |
	
	aStateDiagram _ self radius: 0.5 initial: 1 states: { 1 . 2 . 3 . 4 } transitions: { { 1 . 'b' . 1 } . { 1 . 'a' . 2 } . { 2 . 'b' . 2 } . { 2 . 'a' . 3 } . { 3 . 'a' . 3 } . { 3 . 'b' . 4 } . { 4 . 'a' . 1 } . { 4 . 'b' . 4 } } accepting: { 3 . 4 }.
	
	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to:10.
	
	aStateDiagram title: 'sm1' ; open.
! !

!StateDiagram class methodsFor: 'examples' stamp: 'DF 3/7/2023 22:52:27'!
example9

	"self example9"
	
	| aStateDiagram |
	
	aStateDiagram _ self radius: 0.5 initial: 1 states: { 1 . 2 . 3 . 4 } transitions: { { 1 . 'b' . 1 } . { 1 . 'a' . 2 } . {1 . 'c' .  3} . { 2 . 'a' . 3 }  . { 3 . 'b' . 4 } . { 4 . 'a' . 1 } } accepting: { 3 . 4 }.
	
	aStateDiagram setProperty: #transition_layout_solver_iterations to:10.

	aStateDiagram setProperty: #state_charge to:15.

	aStateDiagram setProperty: #state_layout_spring_strength to: 5.
	
	aStateDiagram setProperty: #state_layout_spring_length to:10.
	
	aStateDiagram title: 'sm1' ; open.

	aStateDiagram explore.! !

!StateDiagram class methodsFor: 'class initialization' stamp: 'DF 3/6/2023 22:05:58'!
initialize

	"self initialize"
	
	Defaults _ CascadingProperties new
		  at: #state_diagram_inset put: 64
		; at: #transition_line_width put:			1
		; at: #state_position_range put: 800
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

!StateDiagram class methodsFor: 'instance creation' stamp: 'DF 3/6/2023 20:16:36'!
radius: aNumber initial: anObject states: aSet transitions: aRelation

	| aStateDiagram map |
		
	aStateDiagram _ self new.
	
	map _ Dictionary new.
			
	aSet do:[:each | map at: each put: (DiagramState new label: each asString; radius: aNumber; yourself) ].	

	aStateDiagram setInitialState: (map at:anObject).
	
	aSet do:[:each | aStateDiagram addState: (map at: each) ].
	
	aRelation do:[:each | aStateDiagram connect: (map at: each key) to: (map at: each value) label: ''].
	
	^aStateDiagram! !

!StateDiagram class methodsFor: 'instance creation' stamp: 'DF 3/6/2023 20:16:40'!
radius: aNumber initial: anObject states: states transitions: tuples accepting: acceptingStates

	| aStateDiagram map |
		
	aStateDiagram _ self new.
	
	map _ Dictionary new.
			
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
