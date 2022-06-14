import { PrismaClient } from '@prisma/client';
import express from 'express';
import axios from 'axios';

const router = express.Router();
const client = axios.create();

const prisma = new PrismaClient();

router.post('/', async (req, res) => {
    const { url, fabricid } = req.body;
    try {
        const result = await prisma.fabricimage.create({
            data: {
                url,
                fabricid,
            },
        });
        res.status(201).json(result);
    } catch (err) {
        res.status(400).json({ message: 'Something went wrong' });
    }
});

router.post('/:fabricId/file/:filename', async (req, res) => {
    const { fabricId, filename } = req.params;
    const file = req.body;
    const savedFilename = Date.now() + filename;
    try {
        await client.post(`${process.env.IMGSERVERURL}/upload/${savedFilename}`, file, {
            headers: { 'Content-Type': 'application/octet-stream' },
        });
        const result = await prisma.fabricimage.create({
            data: {
                fabricid: Number(fabricId),
                url: `http://imgserver/${savedFilename}`,
            },
        });
        res.status(201).json(result);
    } catch (err: any) {
        console.log(err);
        res.status(400).json({ message: err.message });
    }
});

router.get('/:fabricId', async (req, res) => {
    const { fabricId } = req.params;
    const fabricimages = await prisma.fabricimage.findMany({
        where: { fabricid: Number(fabricId) },
    });
    res.json(fabricimages);
});

router.delete('/:id', async (req, res) => {
    const { id } = req.params;
    try {
        await prisma.fabricimage.delete({
            where: { id: Number(id) },
        });
        res.status(204).json();
    } catch (err) {
        res.status(400).json();
    }
});

export default router;
