/*
 ### Homework 3
 Convert
 Remi Denoyer
 2022-08-26
 */

func timeHHMMSS(_ secs: Int) -> (hours: Int, minutes: Int, seconds: Int){
    let hours = secs / 3600
    let mins = (secs % 3600) / 60
    return (hours, mins, secs % 60)
}
