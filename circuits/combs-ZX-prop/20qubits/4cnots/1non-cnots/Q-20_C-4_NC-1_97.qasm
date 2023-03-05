OPENQASM 2.0;
include "qelib1.inc";
qreg q[20];
cx q[7], q[6];
cx q[18], q[2];
x q[12];
cx q[11], q[19];
cx q[16], q[3];
