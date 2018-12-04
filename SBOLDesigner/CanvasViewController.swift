//
//  CanvasViewController.swift
//  SBOLDesigner
//
//  Created by Samuel Bridge on 10/25/18.
//  Copyright © 2018 Samuel Bridge. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return partImageArray.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = partImageArray[indexPath.item]
        AddPart(part: image!)
    }
    
    var partImageArray = [UIImage(named: "engineered-region"), UIImage(named: "promoter"), UIImage(named: "rbs"), UIImage(named: "cds"), UIImage(named: "terminator"), UIImage(named: "cir"), UIImage(named: "gRNA"), UIImage(named: "amino-acid"), UIImage(named: "aptamer"), UIImage(named: "arrowcds"), UIImage(named: "assembly-junction"), UIImage(named: "base"), UIImage(named: "blunt-restriction-site"), UIImage(named: "composite-overlay"), UIImage(named: "composite"), UIImage(named: "cut"), UIImage(named: "cut2"), UIImage(named: "dna-stability-element"), UIImage(named: "five-prime-overhang"), UIImage(named: "insulator"), UIImage(named: "junction"), UIImage(named: "no-glyph-assigned"), UIImage(named: "operator"), UIImage(named: "ori"), UIImage(named: "oriT"), UIImage(named: "pbs"), UIImage(named: "poly-a-site"), UIImage(named: "protease-site"), UIImage(named: "protein-stability-element"), UIImage(named: "restriction-enzyme-recognition-site"), UIImage(named: "ribonuclease-site"), UIImage(named: "rna-stability-element"), UIImage(named: "signature"), UIImage(named: "specific-recombination-site"), UIImage(named: "three-prime-overhang"), UIImage(named: "unspecified"), ]
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.imgImage.image = partImageArray[indexPath.row]
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.black.cgColor
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.DrawView.setCurrentGlyph(image: UIImage(named: "cds")!)
        self.DrawView.setupView()
    }
    
    @IBOutlet var DrawView: DrawView!
    var currentlySelected: UIButton!
    
    
    func AddPart(part: UIImage){
        //currentlySelected.backgroundColor = UIColor.blue
        self.DrawView.setCurrentGlyph(image: part)
    }

}
