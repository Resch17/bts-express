import { PrismaClient } from '@prisma/client';
import express from 'express';
import axios from 'axios';

const router = express.Router();
const client = axios.create();

const prisma = new PrismaClient();

router.post('/:patternid', async (req, res) => {
    const { patternid } = req.params;
    const { url } = req.body;
    try {
        const result = await prisma.patternimage.create({
            data: {
                url,
                patternid: parseInt(patternid),
            },
        });
        res.status(201).json(result);
    } catch (err) {
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.post('/:patternId/file/:filename', async (req, res) => {
    const { patternId, filename } = req.params;
    const file = req.body;
    const savedFilename = Date.now() + filename;
    try {
        await client.post(`${process.env.IMGSERVERURL}/upload/${savedFilename}`, file, {
            headers: { 'Content-Type': 'application/octet-stream' },
        });
        const result = await prisma.patternimage.create({
            data: {
                patternid: Number(patternId),
                url: `http://imgserver/${savedFilename}`,
            },
        });
        res.status(201).json(result);
    } catch (err: any) {
        console.log(err);
        res.status(400).json({ message: err.message });
    }
});

export default router;
