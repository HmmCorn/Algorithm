import Foundation

func solution(_ jobs: [[Int]]) -> Int {

    // 요청시각 기준으로 정렬
    let jobs = jobs.sorted { $0[0] < $1[0] }

    // (작업번호, 요청시각, 소요시간)
    var waitingQueue: [(id: Int, request: Int, duration: Int)] = []
    var currentTime = 0
    var totalReturnTime = 0
    var jobIndex = 0

    while jobIndex < jobs.count || !waitingQueue.isEmpty {
        // currentTime 까지 요청된 작업을 waitingQueue에 추가

        while jobIndex < jobs.count && jobs[jobIndex][0] <= currentTime {
            waitingQueue.append((
                id: jobIndex,
                request: jobs[jobIndex][0],
                duration: jobs[jobIndex][1]
            ))

            jobIndex += 1
        }

        if !waitingQueue.isEmpty {
            // 우선순위: 소요시간 -> 요청시각 -> 작업번호
            // waitingQueue에서 (우선순위)에 맞게 꺼내서 처리

            waitingQueue.sort {
                if $0.duration == $1.duration {
                    if $0.request == $1.request {
                        return $0.id < $1.id
                    }
                    return $0.request < $1.request
                }
                return $0.duration < $1.duration
            }

            let job = waitingQueue.removeFirst()
            currentTime += job.duration
            totalReturnTime += (currentTime - job.request)            

        } else {
            // 다음 작업 시간으로 점프
            currentTime = jobs[jobIndex][0]
        }
    }

    return totalReturnTime / jobs.count
}
