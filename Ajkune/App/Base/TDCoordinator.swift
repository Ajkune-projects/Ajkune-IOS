//
//  TDCoordinator.swift
//  
//
//  Created by Djellza Rrustemi
//

import UIKit


// Base Coordinator protocol
public protocol TDCoordinator {
    /// TriggeTD navigation to the corresponding controller
    func start()
    
    /// Stops corresponding controller and returns back to previous one
    func stop()
}

/// Stop methods is optional
extension TDCoordinator {
    func stop() {
    }
}


// MARK : TDDefaultCoordinator
// DefaultCoordinator conforming to TDCoordinator which supports Delegation
public protocol TDDefaultCoordinator: TDCoordinator {
    associatedtype VC: UIViewController
    var viewController: VC? { get set }
    
    var animated: Bool { get }
    var delegate: TDCoordinatorDelegate? { get }
}

extension TDDefaultCoordinator {
    // default implementation if not overriden
    var animated: Bool {
        get {
            return true
        }
    }
    
    // default implementation of nil delegate, should be overriden when needed
    weak var delegate: TDCoordinatorDelegate? {
        get {
            return nil
        }
    }
}

// MARK : TDPushCoordinator

// Coordinator for supporting Pushing and popoing the navigation controller
public protocol TDPushCoordinator: TDDefaultCoordinator {
    var configuration: ((VC) -> ())? { get }
    var navigationController: UINavigationController? { get }
}

extension TDPushCoordinator where VC: TDCoordinated {
    func start() {
        guard let viewController = viewController else {
            return
        }
        
        configuration?(viewController)
        viewController.setCoordinator(self)
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func stop() {
        delegate?.willStop(in: self)
        navigationController?.popViewController(animated: animated)
        delegate?.didStop(in: self)
    }
    
}

// MARK : TDModalCoordinator

// Coordinator for supporting Presenting and Dismissing a Modal
public protocol TDModalCoordinator: TDDefaultCoordinator {
    var configuration: ((VC) -> ())? { get }
    var navigationController: UINavigationController? { get }
    var destinationNavigationController: UINavigationController? { get }
}

extension TDModalCoordinator where VC: TDCoordinated {
    func start() {
        guard let viewController = viewController else {
            return
        }
        
        configuration?(viewController)
        viewController.setCoordinator(self)
        
        if let destinationNavigationController = destinationNavigationController {
            // wrapper navigation controller given, present it
            navigationController?.present(destinationNavigationController, animated: animated, completion: nil)
        } else {
            // no wrapper navigation controller given, present actual controller
            navigationController?.present(viewController, animated: animated, completion: nil)
        }
    }
    
    func stop() {
        delegate?.willStop(in: self)
        viewController?.dismiss(animated: true, completion: {
            self.delegate?.didStop(in: self)
        })
    }
}



// MARK : TDCoordinatorDelegate

// Delegate that would define additional operation before stopping coordinator
public protocol TDCoordinatorDelegate: class {
    func willStop(in coordinator: TDCoordinator)
    func didStop(in coordinator: TDCoordinator)
}

// MARK : TDCoordinated

/// Used typically on view controlleTD to refer to it's coordinator
public protocol TDCoordinated {
    func getCoordinator() -> TDCoordinator?
    func setCoordinator(_ coordinator: TDCoordinator)
}


