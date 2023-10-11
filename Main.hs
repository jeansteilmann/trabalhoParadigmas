module Main where
import Data.List

data Task = Task {
  taskId :: Int,
  taskDescription :: String,
  taskPriority :: Int,
  taskDueDate :: String 
} deriving (Show)

data BST a = EmptyBST | Node {
  val :: a,
  left :: BST a,
  right :: BST a
} deriving (Show)

insertNode :: BST Task -> Task -> BST Task
insertNode EmptyBST x = Node x EmptyBST EmptyBST
insertNode (Node y left right) x
  | taskPriority x < taskPriority y = Node y (insertNode left x) right
  | otherwise = Node y left (insertNode right x)


removeNode :: BST Task -> Int -> BST Task
removeNode EmptyBST _ = EmptyBST
removeNode (Node y left right) x
  | taskId y == x = mergeBSTs left right
  | taskId y > x = Node y (removeNode left x) right
  | otherwise = Node y left (removeNode right x)

mergeBSTs :: BST Task -> BST Task -> BST Task
mergeBSTs left EmptyBST = left
mergeBSTs EmptyBST right = right
mergeBSTs (Node y1 left1 right1) (Node y2 left2 right2)
  | taskId y1 < taskId y2 = Node y1 left1 (mergeBSTs right1 (Node y2 left2 right2))
  | otherwise = Node y2 (mergeBSTs (Node y1 left1 right1) left2) right2

searchByPriority :: BST Task -> Int -> [Task]
searchByPriority EmptyBST _ = []
searchByPriority (Node y left right) x
  | taskPriority y == x = y : leftResults ++ rightResults
  | otherwise = leftResults ++ rightResults
  where
    leftResults = searchByPriority left x
    rightResults = searchByPriority right x
  
searchByDateRange :: BST Task -> String -> String -> [Task]
searchByDateRange EmptyBST _ _ = []
searchByDateRange (Node y left right) startDate endDate 
  | startDate <= taskDueDate y && taskDueDate y <= endDate = [y]
  | otherwise = searchByDateRange left startDate endDate ++ searchByDateRange right startDate endDate

searchByName :: BST Task -> String -> [Task]
searchByName EmptyBST _ = []
searchByName (Node y left right) name 
  | name `isInfixOf` taskDescription y = [y]
  | otherwise = searchByName left name ++ searchByName right name

listAllTasks :: BST Task -> [Task]
listAllTasks EmptyBST = []
listAllTasks (Node y left right) = [y] ++ listAllTasks left ++ listAllTasks right

main :: IO ()
main = do
  putStrLn "Bem-vindo ao Sistema de Tarefas!"
  
  let tarefa1 = Task {taskId = 1, taskDescription = "Estudar Haskell", taskPriority = 2, taskDueDate = "2023-12-31"}
  let tarefa2 = Task {taskId = 2, taskDescription = "Fazer compras", taskPriority = 1, taskDueDate = "2023-12-24"}
  let tarefa3 = Task {taskId = 3, taskDescription = "Ir a academia", taskPriority = 2, taskDueDate = "2023-12-30"}

  let bst = insertNode (insertNode (insertNode EmptyBST tarefa1) tarefa2) tarefa3

  commandLoop bst

commandLoop :: BST Task -> IO ()
commandLoop bst = do
  putStrLn "\nDigite um comando (ou 'help' para ver os comandos):"
  command <- getLine
  case words command of
    ("help":_) -> do
      printHelp
      commandLoop bst
    ("addTask":description:priority:dueDate:_) -> do
      let newTaskId = length (listAllTasks bst) + 1 
      let newTask = Task newTaskId description (read priority) dueDate
      putStrLn "Tarefa adicionada com sucesso!"
      commandLoop (insertNode bst newTask)
    ("removeTask":taskId:_) -> do
      putStrLn "Tarefa removida com sucesso!"
      commandLoop (removeNode bst (read taskId))
    ("searchByPriority":priority:_) -> do
      printTasks (searchByPriority bst (read priority)) 
      commandLoop bst
    ("searchByDateRange":startDate:endDate:_) -> do
      printTasks (searchByDateRange bst startDate endDate)
      commandLoop bst  
    ("searchByName":name:_) -> do
      printTasks (searchByName bst name)
      commandLoop bst  
    ("listAllTasks":_) -> do
      printTasks (listAllTasks bst)
      commandLoop bst  
    ("exit":_) -> putStrLn "Saindo..."
    _ -> do
      putStrLn "Comando inválido! Digite 'help' para ver a lista de comandos disponíveis."
      commandLoop bst

printHelp :: IO ()
printHelp = do
  putStrLn "Comandos disponíveis:"
  putStrLn "help - Exibe esta lista de comandos"
  putStrLn "addTask - Adiciona uma nova tarefa"
  putStrLn "removeTask - Remove uma tarefa por ID"
  putStrLn "searchByPriority - Busca tarefas por prioridade"
  putStrLn "searchByDateRange - Busca tarefas por data de vencimento em um intervalo"
  putStrLn "searchByName - Busca tarefas por nome"
  putStrLn "listAllTasks - Lista todas as tarefas"
  putStrLn "exit - Sai do programa"
  

printTasks :: [Task] -> IO ()
printTasks tasks = do
    mapM_ (\task -> do { print task; putStrLn "" }) tasks
  
