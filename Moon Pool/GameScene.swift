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
    
    class GameScene: SKScene, SKPhysicsContactDelegate {        
        var ball = SKShapeNode()
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
        func didBegin(_ contact: SKPhysicsContact) {
            if contact.bodyA.node?.name == "brick" || contact.bodyB.node?.name == "brick" {
                print ("you win")
                //brick.removeFromParent()
                
                
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
        
        
        
        func createBackground(){
            let stars = SKTexture(imageNamed: "stars")
            for i in 0...1 {
                let starsBackground = SKSpriteNode(texture: stars)
                starsBackground.zPosition = -1
                starsBackground.position = CGPoint(x: 0, y: starsBackground.size.height * CGFloat(i))
                addChild(starsBackground) // this sends background to game scene
                let moveDown = SKAction.moveBy(x: 0, y: -starsBackground.size.height, duration: 20)
                let moveReset = SKAction.moveBy(x: 0, y: starsBackground.size.height, duration: 0)
                let moveLoop = SKAction.sequence([moveDown, moveReset])
                let moveForever = SKAction.repeatForever(moveLoop)
                starsBackground.run(moveForever)
                //makes array of let
                //endless loop
            }
            
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
            addChild(ball)
        }
        func makeBall2(){
            ball2 = SKShapeNode(circleOfRadius: 10)
            ball2.position = CGPoint(x: frame.midX-29, y: frame.maxY-250)
            ball2.strokeColor = UIColor.black
            ball2.fillColor = UIColor.orange
            ball2.name = "ball"
            ball2.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball2.physicsBody?.isDynamic = false
            ball2.physicsBody?.usesPreciseCollisionDetection = true
            ball2.physicsBody?.friction = 0
            ball2.physicsBody?.affectedByGravity = false
            ball2.physicsBody?.restitution = 1
            ball2.physicsBody?.linearDamping = 0.4
            ball2.physicsBody?.contactTestBitMask = (ball2.physicsBody?.collisionBitMask)!
            addChild(ball2)
        }
        func makeBall3(){
            ball3 = SKShapeNode(circleOfRadius: 10)
            ball3.position = CGPoint(x: frame.midX+29, y: frame.maxY-250)
            ball3.strokeColor = UIColor.black
            ball3.fillColor = UIColor.red
            ball3.name = "ball"
            ball3.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball3.physicsBody?.isDynamic = false
            ball3.physicsBody?.usesPreciseCollisionDetection = true
            ball3.physicsBody?.friction = 0
            ball3.physicsBody?.affectedByGravity = false
            ball3.physicsBody?.restitution = 1
            ball3.physicsBody?.linearDamping = 0.4
            ball3.physicsBody?.contactTestBitMask = (ball3.physicsBody?.collisionBitMask)!
            addChild(ball3)
        }
        func makeBall4(){
            ball4 = SKShapeNode(circleOfRadius: 10)
            ball4.position = CGPoint(x: frame.midX-15, y: frame.maxY-228)
            ball4.strokeColor = UIColor.black
            ball4.fillColor = UIColor.white
            ball4.name = "ball"
            ball4.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball4.physicsBody?.isDynamic = false
            ball4.physicsBody?.usesPreciseCollisionDetection = true
            ball4.physicsBody?.friction = 0
            ball4.physicsBody?.affectedByGravity = false
            ball4.physicsBody?.restitution = 1
            ball4.physicsBody?.linearDamping = 0.4
            ball4.physicsBody?.contactTestBitMask = (ball4.physicsBody?.collisionBitMask)!
            addChild(ball4)
        }
        func makeBall5(){
            ball5 = SKShapeNode(circleOfRadius: 10)
            ball5.position = CGPoint(x: frame.midX+15, y: frame.maxY-228)
            ball5.strokeColor = UIColor.black
            ball5.fillColor = UIColor.gray
            ball5.name = "ball"
            ball5.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball5.physicsBody?.isDynamic = false
            ball5.physicsBody?.usesPreciseCollisionDetection = true
            ball5.physicsBody?.friction = 0
            ball5.physicsBody?.affectedByGravity = false
            ball5.physicsBody?.restitution = 1
            ball5.physicsBody?.linearDamping = 0.4
            ball5.physicsBody?.contactTestBitMask = (ball5.physicsBody?.collisionBitMask)!
            addChild(ball5)
        }
        func makeBall6(){
            ball6 = SKShapeNode(circleOfRadius: 10)
            ball6.position = CGPoint(x: frame.midX, y: frame.maxY-206)
            ball6.strokeColor = UIColor.black
            ball6.fillColor = UIColor.purple
            ball6.name = "ball"
            ball6.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball6.physicsBody?.isDynamic = false
            ball6.physicsBody?.usesPreciseCollisionDetection = true
            ball6.physicsBody?.friction = 0
            ball6.physicsBody?.affectedByGravity = false
            ball6.physicsBody?.restitution = 1
            ball6.physicsBody?.linearDamping = 0.4
            ball6.physicsBody?.contactTestBitMask = (ball6.physicsBody?.collisionBitMask)!
            addChild(ball6)
        }
        func makeBall7(){
            ball7 = SKShapeNode(circleOfRadius: 10)
            ball7.position = CGPoint(x: frame.midX-15, y: frame.maxY-273)
            ball7.strokeColor = UIColor.black
            ball7.fillColor = UIColor.green
            ball7.name = "ball"
            ball7.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball7.physicsBody?.isDynamic = false
            ball7.physicsBody?.usesPreciseCollisionDetection = true
            ball7.physicsBody?.friction = 0
            ball7.physicsBody?.affectedByGravity = false
            ball7.physicsBody?.restitution = 1
            ball7.physicsBody?.linearDamping = 0.4
            ball7.physicsBody?.contactTestBitMask = (ball7.physicsBody?.collisionBitMask)!
            addChild(ball7)
        }
        func makeBall8(){
            ball8 = SKShapeNode(circleOfRadius: 10)
            ball8.position = CGPoint(x: frame.midX+15, y: frame.maxY-273)
            ball8.strokeColor = UIColor.black
            ball8.fillColor = UIColor.blue
            ball8.name = "ball"
            ball8.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            ball8.physicsBody?.isDynamic = false
            ball8.physicsBody?.usesPreciseCollisionDetection = true
            ball8.physicsBody?.friction = 0
            ball8.physicsBody?.affectedByGravity = false
            ball8.physicsBody?.restitution = 1
            ball8.physicsBody?.linearDamping = 0.4
            ball8.physicsBody?.contactTestBitMask = (ball8.physicsBody?.collisionBitMask)!
            addChild(ball8)
        }
        
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
            loseZoneBottomRight = SKSpriteNode( imageNamed: "blackHole")
            loseZoneBottomRight.position = CGPoint(x: frame.midX+170, y: frame.maxY - 645)
            loseZoneBottomRight.name = "loseZoneTopRight"
            loseZoneBottomRight.physicsBody = SKPhysicsBody(circleOfRadius: 10)
            loseZoneBottomRight.physicsBody?.isDynamic = false
            loseZoneBottomRight.physicsBody?.usesPreciseCollisionDetection = true
            addChild(loseZoneBottomRight)
        }
        
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
    } //
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
    
