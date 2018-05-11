    //
    //  GameScene.swift
    //  Moon Pool
    //
    //  Created by Lucy Gjermstad on 4/12/18.
    //  Copyright © 2018 Lucy Gjermstad. All rights reserved.
    // zimka
    //lwiza
    // shanna
    
    import SpriteKit
    import GameplayKit
    
    class GameScene: SKScene, SKPhysicsContactDelegate{
        
        enum CollisionBody:UInt32{
            case None = 1
            case Ball = 2
            case Coin = 3
            
        }
        
        var ball = SKShapeNode()
        private var ballRadius: CGFloat = 25
        var ball2 = SKShapeNode()
        var ball3 = SKShapeNode()
        var ball4 = SKShapeNode()
        var ball5 = SKShapeNode()
        var ball6 = SKShapeNode()
        var ball7 = SKShapeNode()
        var ball8 = SKShapeNode()
        var ball9 = SKShapeNode()
        var ball10 = SKShapeNode()
        var paddle = SKSpriteNode()
        var brick = SKSpriteNode()
        var loseZoneTopRight = SKSpriteNode()
        var loseZoneTopLeft = SKSpriteNode()
        var loseZoneBottomLeft = SKSpriteNode()
        var loseZoneBottomRight = SKSpriteNode()
        
        //sling outlets
        private var sling : SKNode!
        private var rightSlingPosition: CGPoint!
        private var rightSling: SKShapeNode!
        
        
        
        //game info
        private var movingBall = false
        private var gameOver = false
        private var ballIsFlying = false
        
        override func didMove(to view: SKView){
            self.physicsWorld.contactDelegate = self
            
            //sling
            self.sling = self.childNode(withName: "//sling")
            var path = CGMutablePath()
            
            self.rightSlingPosition = self.childNode(withName: "//rightSling")!.position
            
            path = CGMutablePath()
            path.move(to: CGPoint.zero)
            path.addLine(to: sling.position.subtract(point: rightSlingPosition))
            path.closeSubpath()
            
            self.rightSling = SKShapeNode(path: path)
            self.rightSling.lineWidth = 8
            self.rightSling.zPosition = 2
            self.rightSling.fillColor = SKColor.green
            self.rightSling.strokeColor = SKColor.green
            self.addChild(self.rightSling)
            
            self.rightSling.position = self.rightSlingPosition
            
        }
        
        override func update(_ currentTime: TimeInterval) {
            
            // look to see if ball is off screen
            if ball.position.y < -self.size.height/2-100 && !gameOver{
                
                if self.childNode(withName: "coin") == nil{
                    gameOver = true
                    ball.removeFromParent()
                }
                else{
                    ball.physicsBody = nil
                    ball.position = sling.position
                    self.ballIsFlying = false
                    
                }
                
            }
        }
        
        
        func didBegin(_ contact: SKPhysicsContact) {
            
            
        }
        
        //MARK: - Touch Logic
        func touchDown(atPoint pos : CGPoint) {
            for node in self.nodes(at: pos){
                if node == ball && !self.ballIsFlying{
                    movingBall = true
                }
            }
        }
        
        func touchMoved(toPoint pos : CGPoint) {
            if movingBall {
                //Distance from sling
                let movePosition = CGPoint(x:(pos.x-sling.position.x), y:(pos.y-sling.position.y))
                //Clamp
                //let standardDistance = ballRadius * 6
                //let normalX = movePosition.x.clamped(v1: -standardDistance, standardDistance)
                //let normalY = movePosition.y.clamped(v1: -standardDistance, standardDistance)
                
                //let convertedDistance = CGPoint(x: normalX, y: normalY)
                
                //ball.position = convertedDistance.addPoint(point: sling.position)
                
                //Updating sling position
                var path = CGMutablePath()
                path.move(to: CGPoint.zero)
                path.addLine(to: ball.position.subtract(point: rightSlingPosition))
                path.closeSubpath()
                self.rightSling.path = path
                
                
            }
        }

        override func touchesBegan(_ touches: Set<UITouch>, with: UIEvent?){
            for touch in touches {
                let location = touch.location(in: self)
                paddle.position.y = location.y
                paddle.position.x = location.x
                
            }
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with: UIEvent?){
            for touch in touches {
                let location = touch.location(in: self)
                paddle.position.y = location.y
                paddle.position.x = location.x
                
                
            }
        }
        func didBegins(_ contact: SKPhysicsContact) {
            if contact.bodyA.node?.name == "brick" || contact.bodyB.node?.name == "brick" {
                print ("you win")
                brick.removeFromParent()
                
                
            }
            if contact.bodyA.node?.name == "loseZoneTopRight" || contact.bodyB.node?.name == "loseZoneTopRight" {
                print ("you lose")
                ball.removeFromParent()
                ball2.removeFromParent()
                ball3.removeFromParent()
                ball4.removeFromParent()
                ball5.removeFromParent()
                ball6.removeFromParent()
                ball7.removeFromParent()
                ball8.removeFromParent()
                ball9.removeFromParent()
                ball10.removeFromParent()
            }
        }
        override func didMove(to view: SKView) {
            physicsWorld.contactDelegate = self
            self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
            createBackground()
            makeBall()
            makeBall2()
            makeBall3()
            makeBall4()
            makeBall5()
            makeBall6()
            makeBall7()
            makeBall8()
            makeBall9()
            makeBall10()
            makePaddle()
            makeBrick()
            makeLoseZoneTopRight()
            makeLoseZoneTopLeft()
            makeLoseZoneBottomLeft()
            makeLoseZoneBottomRight()
            
            ball.physicsBody?.isDynamic = true
            ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball2.physicsBody?.isDynamic = true
            ball2.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball3.physicsBody?.isDynamic = true
            ball3.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball4.physicsBody?.isDynamic = true
            ball4.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball5.physicsBody?.isDynamic = true
            ball5.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball6.physicsBody?.isDynamic = true
            ball6.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball7.physicsBody?.isDynamic = true
            ball7.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball8.physicsBody?.isDynamic = true
            ball8.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball9.physicsBody?.isDynamic = true
            ball9.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            ball10.physicsBody?.isDynamic = true
            ball10.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
            
        }
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "brick" || contact.bodyB.node?.name == "brick" {
            print ("you win")
            //brick.removeFromParent()
            
        }
        
        
        
        
        
        
        
        func makeBall(){
            ball = SKShapeNode(circleOfRadius: 15)
            ball.position = CGPoint(x: frame.midX, y: frame.maxY-250)
            ball.strokeColor = UIColor.black
            ball.fillColor = UIColor.yellow
            ball.name = "ball"
            ball.physicsBody = SKPhysicsBody(circleOfRadius: 15)
            ball.physicsBody?.isDynamic = false
            ball.physicsBody?.usesPreciseCollisionDetection = true
            ball.physicsBody?.friction = 0
            ball.physicsBody?.affectedByGravity = false
            ball.physicsBody?.restitution = 1
            ball.physicsBody?.linearDamping = 0.4
            ball.physicsBody?.contactTestBitMask = (ball.physicsBody?.collisionBitMask)!
            self.ball.position = sling.position
            let speed: CGFloat = 2
            let force = CGVector(dx: (sling.position.x-ball.position.x) * speed, dy: (sling.position.y-ball.position.y) * speed)
            ball.physicsBody?.applyImpulse(force)
            
            addChild(ball)
        }
        if contact.bodyA.node?.name == "loseZoneTopRight" || contact.bodyB.node?.name == "loseZoneTopRight" {
            print ("you lose")
            ball.removeFromParent()
        }
        if contact.bodyA.node?.name == "loseZoneTopLeft" || contact.bodyB.node?.name == "loseZoneTopLeft" {
            print ("you lose")
            ball2.fillColor = UIColor.black
        }
        
            /*ball3.fillColor = UIColor.black
            ball4.fillColor = UIColor.black
            ball5.fillColor = UIColor.black
            ball6.fillColor = UIColor.black
            ball7.fillColor = UIColor.black
            ball8.fillColor = UIColor.black
            ball9.fillColor = UIColor.black
            ball10.fillColor = UIColor.black
        }
 
        if ball == loseZoneTopRight || ball == loseZoneTopLeft || ball == loseZoneBottomLeft || ball == loseZoneBottomRight{
            ball.fillColor = UIColor.black
        }
        if ball2 == loseZoneTopRight || ball2 == loseZoneTopLeft || ball2 == loseZoneBottomLeft || ball2 == loseZoneBottomRight{
            ball2.removeFromParent()
        }
        if ball3 == loseZoneTopRight || ball3 == loseZoneTopLeft || ball3 == loseZoneBottomLeft || ball3 == loseZoneBottomRight{
            ball3.removeFromParent()
        }
        if ball4 == loseZoneTopRight || ball4 == loseZoneTopLeft || ball4 == loseZoneBottomLeft || ball4 == loseZoneBottomRight{
            ball4.removeFromParent()
        }
        if ball5 == loseZoneTopRight || ball5 == loseZoneTopLeft || ball5 == loseZoneBottomLeft || ball5 == loseZoneBottomRight{
            ball5.removeFromParent()
        }
        if ball6 == loseZoneTopRight || ball6 == loseZoneTopLeft || ball6 == loseZoneBottomLeft || ball6 == loseZoneBottomRight{
            ball6.removeFromParent()
        }
        if ball7 == loseZoneTopRight || ball7 == loseZoneTopLeft || ball7 == loseZoneBottomLeft || ball7 == loseZoneBottomRight{
            ball7.removeFromParent()
        }
        if ball8 == loseZoneTopRight || ball8 == loseZoneTopLeft || ball8 == loseZoneBottomLeft || ball8 == loseZoneBottomRight{
            ball8.removeFromParent()
        }
        if ball9 == loseZoneTopRight || ball9 == loseZoneTopLeft || ball9 == loseZoneBottomLeft || ball9 == loseZoneBottomRight{
            ball9.removeFromParent()
        }
        if ball10 == loseZoneTopRight || ball10 == loseZoneTopLeft || ball10 == loseZoneBottomLeft || ball10 == loseZoneBottomRight{
            ball10.removeFromParent()
        }
     */
    }
    override func didMove(to view: SKView) {
        physicsWorld.contactDelegate = self
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        createBackground()
        makeBall()
        makeBall2()
        makeBall3()
        makeBall4()
        makeBall5()
        makeBall6()
        makeBall7()
        makeBall8()
        makeBall9()
        makeBall10()
        makePaddle()
        makeBrick()
        makeLoseZoneTopRight()
        makeLoseZoneTopLeft()
        makeLoseZoneBottomLeft()
        makeLoseZoneBottomRight()
        
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball2.physicsBody?.isDynamic = true
        ball2.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball3.physicsBody?.isDynamic = true
        ball3.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball4.physicsBody?.isDynamic = true
        ball4.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball5.physicsBody?.isDynamic = true
        ball5.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball6.physicsBody?.isDynamic = true
        ball6.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball7.physicsBody?.isDynamic = true
        ball7.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball8.physicsBody?.isDynamic = true
        ball8.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball9.physicsBody?.isDynamic = true
        ball9.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        ball10.physicsBody?.isDynamic = true
        ball10.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 0))
        
        func makeBall9(){
            ball9 = SKShapeNode(circleOfRadius: 10)
            ball9.position = CGPoint(x: frame.midX, y: frame.maxY-293)
            ball9.strokeColor = UIColor.black
            ball9.fillColor = UIColor.cyan
            ball9.name = "ball"
            ball9.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball9.physicsBody?.isDynamic = false
            ball9.physicsBody?.usesPreciseCollisionDetection = true
            ball9.physicsBody?.friction = 0
            ball9.physicsBody?.affectedByGravity = false
            ball9.physicsBody?.restitution = 1
            ball9.physicsBody?.linearDamping = 0.4
            ball9.physicsBody?.contactTestBitMask = (ball9.physicsBody?.collisionBitMask)!
            addChild(ball9)
        }
        func makeBall10(){
            ball10 = SKShapeNode(circleOfRadius: 10)
            ball10.position = CGPoint(x: frame.midX, y: frame.maxY-500)
            ball10.strokeColor = UIColor.black
            ball10.fillColor = UIColor.white
            ball10.name = "ball"
            ball10.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball10.physicsBody?.isDynamic = false
            ball10.physicsBody?.usesPreciseCollisionDetection = true
            ball10.physicsBody?.friction = 0
            ball10.physicsBody?.affectedByGravity = false
            ball10.physicsBody?.restitution = 1
            ball10.physicsBody?.linearDamping = 0
            ball10.physicsBody?.contactTestBitMask = (ball10.physicsBody?.collisionBitMask)!
            addChild(ball10)
        }
        
        
        //Calculate impulse
       
        
        
        
        
        func makePaddle(){
            
            paddle = SKSpriteNode(color: UIColor.white, size: CGSize(width: frame.width/18, height: 100))
            paddle.position = CGPoint(x: frame.midX, y: frame.midY - 250)
            
            paddle.name = "paddle"
            paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
            paddle.physicsBody?.isDynamic = false
            ball10.physicsBody?.usesPreciseCollisionDetection = true
            ball10.physicsBody?.friction = 0
            ball10.physicsBody?.affectedByGravity = false
            ball10.physicsBody?.restitution = 1
            ball10.physicsBody?.linearDamping = 0
            ball10.physicsBody?.contactTestBitMask = (paddle.physicsBody?.collisionBitMask)!
            
            addChild(paddle)
            
        }
        func makeBrick(){
            brick = SKSpriteNode(color: UIColor.blue, size: CGSize(width:frame.width/5, height: 20))
            brick.position = CGPoint(x: frame.midX, y: frame.maxY - 100)
            brick.name = "brick"
            brick.physicsBody = SKPhysicsBody(rectangleOf: brick.size)
            brick.physicsBody?.isDynamic = false
            addChild(brick)
        }
        
        func makeLoseZoneTopRight(){
            loseZoneTopRight = SKSpriteNode(color: UIColor.red, size: CGSize(width:frame.width/50, height: 10))
            loseZoneTopRight = SKSpriteNode(imageNamed: "blackHole")
            loseZoneTopRight.position = CGPoint(x: frame.midX+170, y: frame.maxY - 20)
            loseZoneTopRight.name = "loseZoneTopRight"
            loseZoneTopRight.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            loseZoneTopRight.physicsBody?.isDynamic = false
            loseZoneTopRight.physicsBody?.usesPreciseCollisionDetection = true
            addChild(loseZoneTopRight)
        }
        func makeLoseZoneTopLeft(){
            loseZoneTopLeft = SKSpriteNode(color: UIColor.red, size: CGSize(width:frame.width/50, height: 10))
            loseZoneTopLeft = SKSpriteNode(imageNamed: "blackHole")
            loseZoneTopLeft.position = CGPoint(x: frame.midX-170, y: frame.maxY - 20)
            loseZoneTopLeft.name = "loseZoneTopRight"
            loseZoneTopLeft.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            loseZoneTopLeft.physicsBody?.isDynamic = false
            loseZoneTopLeft.physicsBody?.usesPreciseCollisionDetection = true
            addChild(loseZoneTopLeft)
        }
        func makeLoseZoneBottomLeft(){
            loseZoneBottomLeft = SKSpriteNode(color: UIColor.red, size: CGSize(width:frame.width/50, height: 10))
            loseZoneBottomLeft = SKSpriteNode(imageNamed: "blackHole")
            loseZoneBottomLeft.position = CGPoint(x: frame.midX-170, y: frame.maxY - 645)
            loseZoneBottomLeft.name = "loseZoneTopRight"
            loseZoneBottomLeft.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            loseZoneBottomLeft.physicsBody?.isDynamic = false
            loseZoneBottomLeft.physicsBody?.usesPreciseCollisionDetection = true
            addChild(loseZoneBottomLeft)
        }
        func makeLoseZoneBottomRight(){
            loseZoneBottomRight = SKSpriteNode(color: UIColor.red, size: CGSize(width:frame.width/50, height: 10))
            loseZoneBottomRight = SKSpriteNode(imageNamed: "blackHole")
            loseZoneBottomRight.position = CGPoint(x: frame.midX+170, y: frame.maxY - 645)
            loseZoneBottomRight.name = "loseZoneTopRight"
            loseZoneBottomRight.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            loseZoneBottomRight.physicsBody?.isDynamic = false
            loseZoneBottomRight.physicsBody?.usesPreciseCollisionDetection = true
            addChild(loseZoneBottomRight)
        }
        
    }
