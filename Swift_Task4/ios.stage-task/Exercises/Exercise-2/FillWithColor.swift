import Foundation

final class FillWithColor {

    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {

        let m = image.count
        if m == 0 { return [] }
        let n = image[0].count

        var tempImage = image
        let oldColor = tempImage[row][column]
        var queue: [[Int]] = []
        print([row,column])
        queue.append([row,column]) // append coordinates of first color point
        
        while !queue.isEmpty {
            let item = queue.removeFirst()
            let i = item[0]
            let j = item[1]

            // change original point with new
            tempImage[i][j] = newColor
            appendToQueu(tempImage, &queue, oldColor, newColor, i, j+1, m, n)
            appendToQueu(tempImage, &queue, oldColor, newColor, i, j-1, m, n)
            appendToQueu(tempImage, &queue, oldColor, newColor, i+1, j, m, n)
            appendToQueu(tempImage, &queue, oldColor, newColor, i-1, j, m, n)
        }
        return tempImage
    }

    func appendToQueu(_ image: [[Int]], _ queue:inout[[Int]],
                        _ oldColor: Int, _ newColor: Int,
                        _ i: Int, _ j: Int ,_ m: Int, _ n: Int) {

        if i < 0 || j < 0 || i >= m || j >= n || image[i][j] != oldColor || image[i][j] == newColor {
            return
        }
        queue.append([i,j])
    }
}
