'From Cuis 5.0 [latest update: #4526] on 31 January 2021 at 4:30:19 pm'!
'Description A library for automatic layout of state machine diagrams'!
!provides: 'Kleene' 1 11!
!requires: 'Gaudi' 1 22 nil!
SystemOrganization addCategory: 'Kleene'!


!classDefinition: #DiagramSelfTransition category: 'Kleene'!
Object subclass: #DiagramSelfTransition
	instanceVariableNames: 'state label magnet'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'DiagramSelfTransition class' category: 'Kleene'!
DiagramSelfTransition class
	instanceVariableNames: ''!

!classDefinition: #DiagramState category: 'Kleene'!
Object subclass: #DiagramState
	instanceVariableNames: 'position radius accepting initial label'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'DiagramState class' category: 'Kleene'!
DiagramState class
	instanceVariableNames: ''!

!classDefinition: #DiagramTransition category: 'Kleene'!
Object subclass: #DiagramTransition
	instanceVariableNames: 'origin path destination label labelMagnets'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'DiagramTransition class' category: 'Kleene'!
DiagramTransition class
	instanceVariableNames: ''!

!classDefinition: #StateDiagram category: 'Kleene'!
Object subclass: #StateDiagram
	instanceVariableNames: 'states transitions selfTransitions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Kleene'!
!classDefinition: 'StateDiagram class' category: 'Kleene'!
StateDiagram class
	instanceVariableNames: ''!


!DiagramSelfTransition methodsFor: 'as yet unclassified' stamp: 'DF 1/16/2021 12:42:12'!
asMorph

	| alpha anArcMorph aLabelMorph labelPosition xoffset yoffset |
	
	alpha _ (magnet position - state position) degrees.
	
	anArcMorph _ ArcMorph new angle:270 ; direction: alpha + 60; arrow: true; arrowHeadLength:8; morphPosition: magnet position; lineWidth:1; color: Color gray; yourself.
	
	labelPosition _ anArcMorph morphLocalBounds center + ((anArcMorph radius@0) rotatedBy: (alpha + 0) degreesToRadians).
	
	aLabelMorph _ LabelMorph new contents: label; yourself.

	aLabelMorph font: (FontFamily defaultFamilyPointSize: 10).
	
	xoffset _ alpha degreesToRadians cos / 2 - 0.5.
	
	yoffset _ alpha degreesToRadians sin / 2 - 0.5. 

	aLabelMorph morphPosition: 	labelPosition + ((xoffset @ yoffset) * aLabelMorph morphExtent)	.
	
	anArcMorph addMorph: aLabelMorph.
	
	^anArcMorph ! !

!DiagramSelfTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/16/2020 19:33:00'!
buildPathIn: aForceSolver

	magnet _ RadialMagnet new radius: state radius ; center: state position; mass:0.1; charge: 0.1; yourself.

	aForceSolver addObject: magnet.
! !

!DiagramSelfTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2020 18:49:08'!
label: aString
	label _ aString! !

!DiagramSelfTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2020 18:49:02'!
state: aDiagramState
	state _ aDiagramState! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 15:17:24'!
accepting: aBoolean
	accepting _ aBoolean! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 1/16/2021 12:41:24'!
asMorph

	| aMorph aLabelMorph pos color |
	
	aLabelMorph _ LabelMorph new contents: label; yourself.

	aLabelMorph font: (FontFamily defaultFamilyPointSize: 10).
	
	pos _ (radius * 2) @ (radius * 2) - aLabelMorph measureContents / 2.

	aLabelMorph morphPosition: pos.
		
	aMorph _ EllipseMorph new.
	
	
	accepting ifTrue:[
		aMorph addMorph: (EllipseMorph new morphExtent: (radius * 2 - 8) @ (radius * 2 - 8) ; morphPosition: 4@4; borderWidth:2 ; color: Color lightYellow; borderWidth: 2; borderColor: Color veryLightGray; yourself)].

	aMorph addMorph: aLabelMorph.

	color _ initial ifTrue:[ Color lightGreen ] ifFalse:[ Color lightYellow ].
	
	aMorph color: color; borderWidth: 2; borderColor: Color veryLightGray.
	
	aMorph morphExtent: (radius * 2) @ (radius * 2) ; morphPosition: position - (radius @ radius).

	^aMorph.	
	
! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 1/16/2021 12:05:49'!
initial: aBoolean
	initial _ aBoolean! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 15:03:05'!
initialize

	accepting _ false.
	initial _ false.! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:54:37'!
label: aString
	label _ aString! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:52:10'!
position
	^position! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:52:20'!
position: aPoint
	position _ aPoint! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:07:15'!
radius
	^radius! !

!DiagramState methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:06:49'!
radius: aNumber
	radius _ aNumber! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 1/16/2021 12:42:01'!
asMorph

	| aMorph aLabelMorph |
	
	aMorph _ SimplePolyLineMorph new.
	
	aMorph path: (path collect:[:each | each position ]).
	
	aMorph arrow: true; lineWidth:1; color: Color gray.

	aLabelMorph _ LabelMorph new contents: label; morphPosition: labelMagnets anyOne position; yourself.
	
	aLabelMorph font: (FontFamily defaultFamilyPointSize: 10).

	aMorph addMorph: aLabelMorph.

"	
	pos _ labelMagnets collect:[:each | each position].
	
	aLabelMorph _ LabelMorph new contents: label; morphPosition: pos min; yourself.
	
	aMorph addMorph: aLabelMorph."
	
	^aMorph! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/21/2020 10:52:39'!
buildLabelIn: aSolver attachedTo: aMagnet

	| c p |
	
	labelMagnets add: aMagnet.
	
	p _ aMagnet position + (-8@-8 extent: 16@16) atRandom..
	
	c _ Magnet charge:35 position: p.
	
	aSolver addObject: c.

	aSolver addConstraint: (Spring length:18 strength:1 between: aMagnet and: c).

	labelMagnets add:	c.
	
	"	
	label size - 1 timesRepeat:[ 
		
		d _ Magnet charge: 15 position: p + delta.
		
		aSolver addObject: d.
		
		aSolver addConstraint: (Spring length: delta r strength:1 between: c and:d).
		aSolver addConstraint: (Horizontal strength: 1 between:c and:d).
		
		c _ d. p _ p + delta ].
	
	label size > 1 ifTrue:[labelMagnets add: d]."! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/21/2020 10:46:35'!
buildPathIn: aForceSolver
	
	| destinationAnchor originAnchor originMagnet midMagnet destinationMagnet direction distance |

	direction _ destination position - origin position.

	distance _ direction r.
	
	direction _ direction normalized.
		
	"we create an anchor for the origin and destination positions"
	
	originAnchor _ Anchor position: origin position.

	aForceSolver addObject: originAnchor.
	
	destinationAnchor _ Anchor position: destination position.

	aForceSolver addObject: destinationAnchor.

	" each anchor is connected to a stick with a radius that is equal to the radius of the origin/destination"

	originMagnet _ Magnet 	charge: 30.0 position: origin position + (direction * origin radius) + ((10 atRandom - 5) @ (10 atRandom -5)).

	path add: originMagnet.
		
	aForceSolver addObject: originMagnet.
	
	aForceSolver addConstraint: (Spring length: origin radius strength:5 between:originAnchor and: originMagnet).

	midMagnet _ Magnet 	charge: (45 to:55) atRandom position: origin position + (direction * distance / 2) + ((10 atRandom - 5) @ (10 atRandom -5)).

	aForceSolver addObject: midMagnet.

	path add: midMagnet.

	self buildLabelIn: aForceSolver attachedTo: midMagnet.
		
	destinationMagnet _ Magnet 	charge:30.0 position: destination position - (direction * origin radius) + ((10 atRandom - 5) @ (10 atRandom -5)).

	aForceSolver addObject: destinationMagnet.

	path add: destinationMagnet.
	
	aForceSolver addConstraint: (Spring length: destination radius strength:5 between:destinationMagnet and: destinationAnchor).

	aForceSolver addConstraint: (Spring length: distance / (10 to:20) atRandom strength: 0.8 between: originMagnet and: midMagnet).

	aForceSolver addConstraint: (Spring length: distance / (10 to:20) atRandom strength: 0.8 between: midMagnet and: destinationMagnet).
! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:16:52'!
destination
	^destination! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 13:58:00'!
destination: aDiagramSource
	destination _ aDiagramSource ! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2020 11:59:43'!
initialize

	path _ OrderedCollection new.
	
	labelMagnets _ Set new.! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:31:59'!
key
	^{ origin . destination } asSet! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:34:07'!
label
	^label! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:00:38'!
label: aString
	label _ aString! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 14:16:54'!
origin
	^origin! !

!DiagramTransition methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 13:57:34'!
origin: aDiagramState
	origin _ aDiagramState! !

!StateDiagram methodsFor: 'as yet unclassified' stamp: 'DF 12/13/2020 13:59:07'!
addState: aDiagramState
	states add: aDiagramState.! !

!StateDiagram methodsFor: 'as yet unclassified' stamp: 'DF 1/31/2021 14:48:13'!
asMorph

	| aMorph |
	
	self layoutDiagram.
	
	aMorph _ ProtrudingKernelMorph new morphExtent: 640@480; color: Color transparent yourself.
	
	transitions do:[:each | aMorph addMorph: each asMorph].

	selfTransitions do:[:each | aMorph addMorph: each asMorph].
	 
	states do:[:each | aMorph addMorph: each asMorph].

	^aMorph ! !

!StateDiagram methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2020 18:44:45'!
connect: originDiagramState to: destinationrDiagramState label: aString
	
	originDiagramState = destinationrDiagramState 
		ifTrue:[
			selfTransitions add: (DiagramSelfTransition new state: originDiagramState; label: aString; yourself) ]
		ifFalse:[
			transitions add: (DiagramTransition new origin: originDiagramState ; destination: destinationrDiagramState ; label: aString; yourself) ].
		
		! !

!StateDiagram methodsFor: 'as yet unclassified' stamp: 'DF 12/15/2020 18:40:15'!
initialize

	states _ Set new.
	transitions _ Set new.
	selfTransitions _ Set new.! !

!StateDiagram methodsFor: 'as yet unclassified' stamp: 'DF 1/31/2021 14:48:20'!
layoutDiagram

	self layoutStates ; layoutTransitions.
	
	
	! !

!StateDiagram methodsFor: 'as yet unclassified' stamp: 'DF 1/31/2021 16:27:44'!
layoutStates

	| magnets constraints aSolver |
		
	magnets _ Dictionary new.
	
	states do:[:each | magnets at: each put: (Magnet charge: each radius * 12 position: 2000 atRandom @ 2000 atRandom) ].
	
	constraints _ Dictionary new.
	
	transitions 
		do:[:each | 
			constraints at: each key 
				ifPresent:[ :aConstraint | 
					aConstraint length: (aConstraint length max: each label size) ]
				ifAbsent:[constraints at: each key 
					put: (Spring length: 180  strength: 0.08 between: (magnets at: each origin) and: (magnets at: each destination)) ] ].
		
	aSolver _ ForceDirectedSolver 	new.
	
	magnets do:[:each | aSolver addObject: each].
	
	constraints do:[:each | aSolver addConstraint: each].
	
	aSolver trackProgress.

	aSolver ensureSeparationBy: 15 * 2; errorTolerance: 0.025 * magnets size; solve: 550.
	
	magnets associations do:[:each | each key position: each value position ].! !

!StateDiagram methodsFor: 'as yet unclassified' stamp: 'DF 1/31/2021 14:58:48'!
layoutTransitions

	| aSolver | 
	
	aSolver _ ForceDirectedSolver 	new.
		
	transitions do:[:each | each buildPathIn: aSolver ].

	selfTransitions do:[:each | each buildPathIn: aSolver ].
	
	aSolver trackProgress.
	
	aSolver ensureSeparationBy: 0.25; errorTolerance:0.25 * transitions size; solve: 15.

		
	
! !

!StateDiagram methodsFor: 'as yet unclassified' stamp: 'DF 12/14/2020 11:21:56'!
window

	"answers the smallest rectangle that holds all the states in the system"
	
	| window radius |
	 
	window _ 0@0 extent: 0@0.
	
	states do:[:each| window _ window encompass: each position].
	
	radius _ (states collect:[:each | each radius]) max.
	
	window _ window expandBy: (radius @ radius) * 1.5.
	
	^window! !

!StateDiagram class methodsFor: 'as yet unclassified' stamp: 'DF 12/21/2020 10:55:50'!
example

	"self example"
	
	| a b c aStateDiagram |
	
	a _ DiagramState new radius:30 ; label:'a'; yourself.
	
	b _ DiagramState new radius:30 ; label:'b' ; yourself.
	
	c _ DiagramState new radius:30 ; label:'c';  accepting: true; yourself.

	aStateDiagram _ self new.

	aStateDiagram addState: a; addState:b ; addState:c.
	
	aStateDiagram connect: a to: b 	label: 'open'.
	aStateDiagram connect: b to: a 	label: 'swap'.
	aStateDiagram connect: a to: a 	label: 'self'.
	aStateDiagram connect: b to: c 	label: 'done'.
	aStateDiagram connect: b to: c 	label: 'close'.
	aStateDiagram connect: a to: c 	label: 'insert'.
	
	[aStateDiagram asMorph embeddedInZoomingWindowLabeled: 'State Diagram'] fork
! !

!StateDiagram class methodsFor: 'as yet unclassified' stamp: 'DF 12/21/2020 10:56:14'!
example2

	"self example2"
	
	| abc ab bc ac a b c empty aStateDiagram |
	
	a _ DiagramState new radius:30 ; label:'{a}'; yourself.
	
	b _ DiagramState new radius:30 ; label:'{b}' ; yourself.
	
	c _ DiagramState new radius:30 ; label:'{c}';  yourself.

	ab _ DiagramState new radius:30 ; label:'{a,b}'; yourself.
	
	bc _ DiagramState new radius:30 ; label:'{b,c}' ; yourself.
	
	ac _ DiagramState new radius:30 ; label:'{a,c}';  yourself.

	abc _ DiagramState new radius:30 ; label:'{a,b,c}';  yourself.
	
	empty _ DiagramState new radius:30; label:'{}'; yourself.

	aStateDiagram _ self new.

	aStateDiagram addState:empty; addState: a; addState:b ; addState:c; addState: ab; addState: bc; addState:ac; addState:abc.
	
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

	aStateDiagram connect: ab to: ab 	label: 'a'.
	aStateDiagram connect: ab to: ab 	label: 'b'.

	aStateDiagram connect: ab to: abc 	label: 'c'.	
	aStateDiagram connect: bc to: abc 	label: 'a'.
	aStateDiagram connect: ac to: abc 	label: 'b'.

	aStateDiagram connect: abc to: abc 	label: 'a,b,c'.
	
	[aStateDiagram asMorph embeddedInZoomingWindowLabeled: 'State Diagram'] fork.
! !

!StateDiagram class methodsFor: 'as yet unclassified' stamp: 'DF 12/19/2020 16:38:54'!
example3

	"self example3"
	
	| a aStateDiagram |
	
	a _ DiagramState new radius:30 ; label:'a'; yourself.
	
	aStateDiagram _ self new.

	aStateDiagram addState: a.
	
	aStateDiagram connect: a to: a 	label: 'self'.
	
	aStateDiagram asMorph embeddedInZoomingWindowLabeled: 'State Diagram'.
! !

!StateDiagram class methodsFor: 'as yet unclassified' stamp: 'DF 12/21/2020 13:56:11'!
example4

	"self example4"
	
	| states aStateDiagram |
	
	aStateDiagram _ self new.
	
	states _ (1 to: 11) collect:[ :each | DiagramState new radius:15 ; label: each asString; yourself].

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
	
	aStateDiagram asMorph embeddedInZoomingWindowLabeled: 'State Diagram'.
! !
