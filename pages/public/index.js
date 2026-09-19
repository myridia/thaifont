import wordList from './wordlist.js'; // Import the array
function tokenize(w,d) {
    const arr = []

    for (let i = 0; i < w.length;) {

        let sub = []

        d.forEach(v2 => {

            if (w[i] + w[i + 1] === v2[0] + v2[1]) sub.push([v2, v2.length])

        })

        sub.sort((a, b) => b[1] - a[1])

        for (let ii = 0; ii < sub.length; ii++) {

            const l = sub[ii][1] + i
            const s = w.substring(i, l)

            if (sub[ii][0] === s) {

                i = l - 1
                arr.push(s)
                ii = sub.length

            }

        }

        i++

    }

    return arr

}

const d = wordList;
const w = " ข้อความนี้ใช้ฟอนต์ Myridia ซึ่งเป็นฟอนต์แบบกำหนดเองที่ฝังไว้โดยใช้ CSS โปรดตรวจสอบให้แน่ใจว่าไฟล์ฟอนต์อยู่ในไดเร็กทอรีเดียวกันกับไฟล์ HTML นี้ หรือปรับเส้นทาง `src: url()` ให้เหมาะสม";


const r = tokenize(w,d);

console.log(r);


