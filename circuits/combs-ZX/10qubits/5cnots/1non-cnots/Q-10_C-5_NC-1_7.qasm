OPENQASM 2.0;
include "qelib1.inc";
qreg q[10];
cx q[9], q[6];
cx q[4], q[1];
cx q[9], q[3];
z q[3];
cx q[6], q[0];
cx q[9], q[8];
