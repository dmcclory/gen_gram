class GenGram::Parser

rule
  target: S { result =  "success" }

  S: NP VP

  NP: DET N
    | DET AP
    | N

  AP: A N
    | A AP

  VP: V
    | V NP
    | V NP NP
    | V A

end
---- inner ----

def parse(tokens)
  @tokens = tokens
  do_parse
end

def next_token
  @tokens.shift
end
