import { execSync } from 'child_process'
import chalk from 'chalk';
import { unlinkSync, writeFileSync } from 'fs';
import { homedir } from 'os';

class dependency {
  constructor(name, met, meet) {
    this.name = name,
      this.met = met,
      this.meet = meet
  }
}

let dependices = [

]

dependices.push(new dependency(
  'Git Configuration',
  async () => {
    let response = await fetch('https://raw.githubusercontent.com/tristansokol/dotfiles/master/git/gitconfig')
    writeFileSync('gitConfig.temp', await response.text())
    let diff = 'fail';
    try {
        diff =  execSync(`git  diff --exit-code --no-index ~/.gitconfig ~/Development/dotfiles/git/gitconfig`).toString()
    } catch (error) {
      //log out the diff, would be better if it were colored. 
      console.log(error.output[1].toString())
    }
    unlinkSync('gitConfig.temp')
    if (!diff){
      return true
    }
    return false 
  },
  async () => { 
    let d = +new Date
    console.log(chalk.yellowBright(`making a copy of gitconfig at ~/.gitconfig.${d}.old`))
     execSync(`mv ~/.gitconfig ~/.gitconfig.${d}.old`)
    
    // let response = await fetch('https://raw.githubusercontent.com/tristansokol/dotfiles/master/git/gitconfig')
    // let expected = await response.text()
    // writeFileSync(`${homedir()}/.gitconfig`,expected )
    console.log(chalk.yellowBright(`Symbolically linking ~/Development/dotfiles/git/gitconfig ~/.gitconfig`))
    execSync(`ln -is ~/Development/dotfiles/git/gitconfig ~/.gitconfig`)
  }

))
for (let i = 0; i < dependices.length; i++) {
  const dep = dependices[i];
  if (await dep.met()) {
    console.log(`✔️ ${dep.name}`)
  } else {
    console.log(`🆕 Installing ${dep.name}`)
    await dep.meet()
  }
  // i=i-1
}