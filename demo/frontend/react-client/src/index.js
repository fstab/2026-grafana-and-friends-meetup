import {createRoot} from 'react-dom/client';

// The id="root" is from the index.html file
const rootElement = document.getElementById('root');
const root = createRoot(rootElement);

const restEndpoint = "/grots";

const callRestApi = async () => {
    const response = await fetch(restEndpoint);
    return await response.json();
};

const jsonList = await callRestApi();
const listItems = jsonList.map(record => <li>{record.name}</li>);

root.render(<div><h1>List of Grots</h1><ul>{listItems}</ul></div>);