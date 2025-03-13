<?php
header('Content-Type: application/json; charset=UTF-8');

function errorResponse($code, $message) {
    echo json_encode(["status" => $code, "message" => $message]);
    exit;
}

if (!isset($_POST['numPeople']) || !is_numeric($_POST['numPeople'])) {
    errorResponse(1, "Input value does not exist or value is invalid.");
}

$numPeople = intval($_POST['numPeople']);

if ($numPeople <= 0) {
    errorResponse(1, "Input value must be greater than zero.");
}

// Generate 52 playing cards
$suits = ['S', 'H', 'D', 'C'];
$values = [1 => 'A', 2, 3, 4, 5, 6, 7, 8, 9, 10 => 'X', 11 => 'J', 12 => 'Q', 13 => 'K'];
$deck = [];

foreach ($suits as $suit) {
    foreach ($values as $key => $value) {
        $deck[] = "$suit-$value";
    }
}

// shuffle
shuffle($deck);

// Distribute playing cards
$result = [];
for ($i = 0; $i < count($deck); $i++) {
    $personIndex = $i % $numPeople;
    $result[$personIndex][] = $deck[$i];
}

// Formatted output
$formattedResult = [];
foreach ($result as $index => $cards) {
    $formattedResult[] = ["player" => $index + 1, "cards" => implode(", ", $cards)];
}

// Return JSON
echo json_encode(["status" => "success", "data" => $formattedResult]);

?>
