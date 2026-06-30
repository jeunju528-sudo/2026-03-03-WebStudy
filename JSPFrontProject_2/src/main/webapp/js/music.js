/**
 * 
 */
window.onload = () => {
    axios.get('music.do')
        .then(response => {
            console.log(response.data)
            list = response.data
            let html = ''
            list.forEach((m) => {
                let s = ''
                if (m.state === '상승') {
                    s = '<font color="red">↑</font>' + m.id
                }
                else if (m.state === '하강') {
                    s = '<font color="blue">↓</font>' + m.id
                }
                else {
                    s = '-'
                }
                html += '<tr>'
                    + '<td class="text-center">' + m.no + '</td>'
                    + '<td class="text-center">' + s + '</td>'
                    + '<td class="text-center"><img src="' + m.poster + '" width=30px></td>'
                    + '<td class="text-center">' + m.title + '</td>'
                    + '<td class="text-center">' + m.singer + '</td>'
                    + '</tr>'
            })
            let tbody = document.querySelector("#user-table tbody")
            tbody.innerHTML = html
        })

    let tr = document.querySelector("#user-table thead tr:first-child")
    tr.style.backgroundColor = 'orange'

    let key = document.querySelector("#keyword")
    key.addEventListener('keyup', function() {
        const keyword = this.value.trim()
        const rows = document.querySelectorAll("#user-table > tbody > tr")
        /* for(let i=0; i<rows.length; i++){
            rows[i].style.display='none'
        }
    	
        const find = document.querySelectorAll('#user-table > tbody > tr > td:nth-child(5n+4):contains("'+key+'")')
        for(let i=0; i<find.length; i++){
            find[i].style.display=''
        	
        } */
        rows.forEach((row) => {
            const title = row.querySelector('td:nth-child(4)').textContent
            console.log(title)
            if (title.includes(keyword)) {
                row.style.display = ''
            }
            else {
                row.style.display = 'none'
            }
        })

    })

}
