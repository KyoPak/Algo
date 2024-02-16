import Foundation

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    var skills = skill.map { String($0) }
    var answer = 0
    
    for trees in skill_trees {
        var skill_tree = trees.map { String($0) }
        var skillIndex = 0
        var flag = true
        
        for tree in skill_tree {
            if skills.contains(tree) {
                if tree == skills[skillIndex] { 
                    flag = true
                    skillIndex += 1
                    continue
                } 
                
                flag = false
                break 
            }
        }
        
        if flag { answer += 1 }
    }
    
    return answer
}
